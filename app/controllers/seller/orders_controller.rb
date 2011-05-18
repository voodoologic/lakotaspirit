class Seller::OrdersController < ApplicationController
protect_from_forgery :only => [:create, :update, :destroy]


	before_filter do |controller|
 		controller.require_user(4)
	end
  def index
  #if then statement for user goes here.  Based on order_items -- worst comment evah
    @orders = Order_all_by_user_id(@current_user.id)
    @orders = Items.find_all_by_user_id(@current_user.id) 
  	@page_title = "Listing #{@status}"
  	
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
  
  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @order = Order.new

  end

  # GET /items/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@order) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        flash[:notice] = 'Order was successfully updated.'
        format.html { redirect_to(@order) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
  def orders_for_seller
    
  end
end

