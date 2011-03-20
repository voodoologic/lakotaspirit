class PaymentNotificationsController < ApplicationController
protect_from_forgery :except => [:create]
  def create
   PaymentNotification.create!(:params => params, :cart_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    @order = Order.new(:params => params,
    					:email => params[:payer_email],
						:ship_to_first_name => params[:first_name],
						:ship_to_last_name => params[:last_name],
						:ship_to_address => params[:address_street],
						:ship_to_city => params[:address_city],
						:ship_to_postal_code => params[:address_zip],
						:ship_to_country => params[:address_country],
						:paypal_invoice => params[:invoice])
	@cart = Cart.find(params[:invoice])
   populate_order
  	@order.open
  	render :nothing => true
  end
  def populate_order
			for cart_item in @cart.cart_items
				order_item = OrderItem.new(
					:item_id => cart_item.item_id,
					:price => cart_item.price,
					:amount => cart_item.amount
				)
			@order.order_items << order_item
			end
	end
end
