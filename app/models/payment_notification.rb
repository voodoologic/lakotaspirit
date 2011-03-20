class PaymentNotification < ActiveRecord::Base
	belongs_to :cart
	serialize :params
	after_create :mark_cart_as_purchased
	attr_accessible :params, :cart_id, :status, :transaction_id

	private
	
	def mark_cart_as_purchased
		if status == "Completed" && params[:secret] == APP_config[:paypal_secret] && params[:mc_gross] == cart.total_price.to_s && params[:receiver_email] == APP_CONFIG[:paypal_email]
			cart.update_attribute(:purchased_at, Time.now)
		end
	end
end
