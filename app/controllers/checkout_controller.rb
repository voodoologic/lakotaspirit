class CheckoutController < ApplicationController
protect_from_forgery :only => [:create, :update, :destroy]

before_filter :initialize_cart

  def index
  		@order = Order.new
  		@page_title = "Checkout"
  		if @cart.items.empty?
	  		flash[:notice] = "Your shopping cart is empty! Please, add something to it before proceeding to check"
	  		redirect_to :controller => 'browse'
	  	end
  end

  def place_order
  	@page_title = "Checkout"
  	@order = Order.new(params[:order])
  	@order.customer_ip = request.remote_ip
  	populate_order
  	if @order.save
  		if @order.process
  			flash[:notice] = 'Your order has been submitted and will be processed immediately.'
  			session[:order_id] = @order.id
  			# Empty the Cart
  			@cart.cart_items.destroy_all
  			redirect_to :action => 'thank_you'
  		else
  			flash[:notice] = "Error while placing order."
  			render :action => 'index'
  		end
  	else
  		render :action => 'index'
  	end	
  end

  def thank_you
  	
  end
	private
	# this order is for when the customer fills out the web-form 
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
	# this is for when customer goes directly to paypal
		def setup_order
			@order.customer_ip = request.remote_ip
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
