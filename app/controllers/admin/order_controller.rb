class Admin::OrderController < ApplicationController
  def index
  #if then statement for user goes here.  Based on order_items
  @orders = Item.find_all_by_user_id("#{@current_user.username}")
  	@status = params[:id]
  	if @status.blank?
  		@status = 'all'
  		conditions = nil
  	else
  		conditions = "status = '#{@status}'"
  	end
  	
  	@page_title = "Listing #{@status}"
  	
  end

  def show
  end

  def close
  end

end
