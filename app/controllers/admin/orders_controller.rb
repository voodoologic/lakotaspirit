class Admin::OrdersController < ApplicationController
protect_from_forgery :only => [:create, :update, :destroy]

		before_filter do |controller|
	 		controller.require_user(4)
	 	end
		
	 	def index
	 		@orders = Order.all[1..5]
	 		if params[:status]
	 		 @orders = Order.find_all_by_status(params[:status]) 
			end
      @orders_this_week = Order.week_so_far
      @orders_this_month = Order.month_so_far
			@open_orders = Order.open.flatten[1..5]
      @closed_orders = Order.closed
			@items = Item.all[1...5]
			@undelivered_items = order_items_paid_but_undelivered(@open_orders)
		end
		
		def show
			@order = Order.find_by_id(params[:id])
		end
		def close
			@order = Order.find(params[:id])
			@order.close
			flash[:notice] = "order for #{@order.ship_to_first_name} #{@order.ship_to_last_name} has been closed"
			redirect_to :action => "index", :status => 'closed'
		end
		#This will take closed items and remove them from the marketplace UPDATE --- done in Order.rb
		# def update_item_status
		# 	@items_ids = @order.order_items.collect{|x| x.item.id }
		# 	for item in @items_ids
		# 		Item.find_by_id(item).update_attribute(:status, 4)
		# 	end
		# end
		private
	  def order_items_paid_but_undelivered(open_orders)
	  undelivered_items = []
	    undelivered_items = open_orders.collect{|orders| orders.order_items}.flatten
	    undelivered_items = undelivered_items.collect{|x| x.item}
	  return undelivered_items 
	  end
	  def process_generic_item_info(order_item)
	    items_array = [] 
		order_item.collect{ |item| items_array << [ item.user.full_name, item.title, item.status, item.update_at]}
	    return items_array
	  end
end
