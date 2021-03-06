class Order < ActiveRecord::Base
	attr_protected :id, :customer_ip, :updated_at, :created_at
	attr_accessor :card_type, :card_number, :card_expiration_month, :card_expiration_year, :card_verification_value, :status, :error_message, :express_validate_token
	before_validation :set_status
	has_many :order_items
	has_many :items, :through => :order_items
  has_many :users, :through => :order_users
	#named scope methods
	named_scope :completed, :conditions => { :status => "processed" }
	named_scope :failed, :conditions => { :status => "failed" }
	named_scope :open, :conditions => { :status => "open" }
	named_scope :closed, :conditions => { :status => "closed" }
  #might need to changed the names below to "processed"
  named_scope :week_so_far, :conditions => { :status => "processed",  :created_at => (Time.now.beginning_of_week() - 1.day)..Time.now }
  named_scope :month_so_far, :conditions => { :status => "processed",  :created_at => (Time.now.beginning_of_month)..Time.now }
  named_scope :for_seller, lambda {|*args|  {:joins => { :order_items => { :item => :user }}, :conditions =>  ["users.username = ?", args.first]} }
	def open
		self.status == 'open'
		save!	
	end
	def process
		raise "Order is closed" if self.status == "closed"
		begin
			process_with_active_merchant
		rescue => e
			logger.error("Order #{id} failed with error message #{e}")
			error_message = 'Error while processing order, son'
			self.status = "failed"
	
		end
		save!
		self.status = 'processed'
    order_items.each{|order_item| order_item.item.update_attribute(:status, 4)}
	end
	
	def close
		self.status = 'closed'
		save!
	end
	
	def process_with_active_merchant
		ActiveMerchant::Billing::Base.mode = :test
		
			gateway = ActiveMerchant::Billing::PaypalGateway.new(

			:login => 'Seller_1286067248_biz_api1.gmail.com',
			:password => "5WKRUVKFMACZRKBG",
			:signature => "AlNb6zSSosVHXVonfVi6TVeygxIkAyHBb2ymYnyQ1L1xjhBf44ZKJSCW"

			)
		
		
		creditcard = ActiveMerchant::Billing::CreditCard.new(
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
			:description => 'Jewelery',
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

#
	PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem")
	APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")
	APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")

	def encrypt_for_paypal(values)
 		signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
		OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
	end
	def card_type=(type)
		@card_type = type
	end
	
	def card_type
		@card_type
	end
	
	def total
		order_items.inject(0) {|sum, n| n.price * n.amount + sum}
	end
	def set_status
		self.status = "open" if self.status.blank?
    #new order needs to change the status of each item.
	end	
def validations
#			validates_size_of :order_items, :minimum => 1
#			validates_length_of :ship_to_first_name, :in => 2..255
#			validates_length_of :ship_to_last_name, :in => 2...255
#			validates_length_of :ship_to_address, :in => 2..255
#			validates_length_of :ship_to_city, :in => 2..255
#			validates_length_of :ship_to_postal_code, :in => 2..255
#			validates_length_of :ship_to_country, :in => 2..255
#			validates_length_of :phone_number, :in => 7..20
#			validates_length_of :customer_ip, :in => 7..15
#			validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
#			validates_inclusion_of :status, :in => %w(open precessed closed failed)
#			validates_inclusion_of :card_type, :in => ['Visa', 'MasterCard', 'Discover'], :on => :create
#			validates_length_of :card_number, :in => 13..19, :on => :create
#			validates_inclusion_of :card_expiration_month, :in => %w(1 2 3 4 5 6 7 8 9 10 11 12), :on => :create
#			validates_inclusion_of :card_expiration_year, :in => (Array(Time.now.year..Time.now.year + 6)), :on => :create
#			validates_inclusion_of :card_verification_value, :in => 3..4, :on => :create
end

end
