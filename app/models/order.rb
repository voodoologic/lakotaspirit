class Order < ActiveRecord::Base
	attr_protected :id, :customer_ip, :status, :error_messages, :updated_at, :created_at
	attr_accessor :card_type, :card_number, :card_expiration_month, :card_expiration_year, :card_verification_value
	before_validation :set_status
	has_many :order_items
	has_many :items, :through => :order_items
	
	#named scope methods
	named_scope :completed, :conditions => { :status => "processed" }
	named_scope :failed, :conditions => { :status => "failed" }
	named_scope :open, :conditions => { :status => "open" }

	def process
		raise "Order is closed" if closed?
		begin
			process_with_active_merchant
		rescue => e
			logger.error("Order #{id} failed with error message #{e}")
			self.error_message = "Error while processing order"
			self.status = "failed"
		end
		save!
		self.status == 'processed'
	end
	
	def process_with_active_merchant
		Base.gateway_mode = :test
		
			gateway = ActiveMerchant::Billing::PaypalGateway.new(

			:login => 'Seller_1286067248_biz_api1.gmail.com',
			:password => "286067202",
			#:cert_path => File.join(File.dirname(__FILE__),"../../config/paypal",
			:cert_path => "#{RAILS_ROOT}/cert/sandbox.crt",
			:cert_id => "E7XGJKG76UKP2"

			)
		gateway.connection.wiredump_dev = STDERR
		
		creditcard = CreditCard.new(
			:type						=> card_type,
			:number					=> card_number,
			:verification_value	=> card_verification_value,
			:month					=> card_expiration_month,
			:year						=> card_expiration_year,
			:first_name				=> ship_to_first_name,
			:last_name				=> ship_to_last_name
			)
	#buyer information
		params = {
			:order_id => self.id,
			:email => email,
			:address => { 	:address1 => ship_to_address,
								:city => ship_to_city,
								:country => ship_to_country,
								:zip => ship_to_postal_code,
							},
			:description => 'Jewelry',
			:ip => customer_ip
			}
			
		response = gateway.purchase(total, creditcard, params)
		
		if response.success?
			self.status = 'processed'
		else
			self.error_message = response.message
			self.status = 'failed'
		end
	end
	
	def card_type=(type)
		@card_type = type
	end
	
	def card_type
		@card_type
	end
	
	def total
		oder_items.inject(0) {|sum, n| n.price * n.amount + sum}
	end
	protected
	def set_status
		self.status = "open" if self.status.blank?
	end	
		
	validates_size_of :order_items, :minimum => 1
	validates_length_of :ship_to_first_name, :in => 2..255
	validates_length_of :ship_to_last_name, :in => 2...255
	validates_length_of :ship_to_address, :in => 2..255
	validates_length_of :shit_to_city, :in => 2..255
	validates_length_of :ship_to_postal_code, :in => 2..255
	validates_length_of :ship_to_country, :in => 2..255
	
	validates_length_of :phone_number, :in => 7..20
	validates_length_of :customer_ip, :in => 7..15
	validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
	validates_inclusion_of :status, :in => %w(open precessed closed failed)
	validates_inclusion_of :card_type, :in => ['Visa', 'MasterCard', 'Discover'], :on => :create
	validates_length_of :card_number, :in => 13..19, :on => :create
	validates_inclusion_of :card_expiration_month, :in => %w(1 2 3 4 5 6 7 8 9 10 11 12), :on => :create
	validates_inclusion_of :card_expiration_year, :in => (Array(Time.now.year..Time.now.year + 6)), :on => :create
	validates_inclusion_of :card_verification_value, :in => 3..4, :on => :create
end