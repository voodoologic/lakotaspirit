class CartController < ApplicationController
	before_filter :initialize_cart
	def add
#		params[:id].gsub!(/item_/, "")
		@jewelry = Item.find(params[:id])
		
		if request.xhr?
		#check to see if quantity is not maxed out
			if verify_item_quantity?
				@jewelry = @cart.add(params[:id])
				flash.now[:cart_notice] = "Added <em>#{@jewelry.item.title}</em>"
				render :action => "add_with_ajax"
			else
				@jewelry = @cart.add(params[:id])
				flash.now[:cart_notice] = "you already have that item"
				render :action => "add_with_ajax"
			end
		elsif request.post?
			@jewelry = @cart.add(params[:id])
			flash[:cart_notice] = "Added <em>#{@jewelry.item.title}</em>"
			redirect_to session[:return_to] || {:controller => "browse"}
			
		else
			render
		end
	end
	def remove
		@item = Item.find(params[:id])
		
		if request.xhr?
			@jewelry = @cart.remove(params[:id])
			flash.now[:cart_notice] = "Removed 1 <em>#{@jewelry.item.title}</em>"
			render :action => "remove_with_ajax"
		elsif request.post?
			@jewelry = @cart.remove(params{:id})
			flash[:cart_notice] = "Removed 1 <em>#{@jewelry.item.tittle}</em>"
			redirect_to :controller => "browse"
		else
		  render
		end
		 
	end
	def clear
		if request.xhr?
			@cart.cart_items.destroy_all
			flash.now[:cart_notice] = "Cleared the Cart"
			render :action => "clear_with_ajax"
		elsif request.post?
			@cart.cart_items.destroy_all
			flash[:cart_notice] = "Cleared the cart"
			redirect_to :controller => "browse"
		else
			render
		end
	end
	def verify_item_quantity?
		cart_item = @cart.cart_items.find_by_item_id(params[:id])
		if cart_item.nil? 
			then true
		elsif
			(cart_item.amount < @jewelry.quantity)
			then true
		else
			false	
		end	
	end
	
	
end
