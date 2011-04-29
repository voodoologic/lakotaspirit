# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def add_item_link(text, item)
		link_to_remote text, {:url => {:controller => "cart",
														:action => "add",
														:id => item}},
												{:title => "Add to Cart",
														:href => url_for( :controller => "cart", 
																				:action => "add", 
																				:id => item)}
	end
	
	def remove_item_link(text, item)
		link_to_remote text, {:url => {:controller => "cart",
														:action => "remove",
														:id => item}},
												{:title => "Remove from cart",
														:href => url_for( :controller => "cart", 
																				:action => "remove", 
																				:id => item)}
	end
	
	def clear_cart_link(text = "Clear Cart")
		link_to_remote text,
				{:url => { :controller => "cart", 
								:action => "clear"}},
				{:href => url_for(:controller => "cart",
										:action => "clear")}
	end
	def authorization_check(auth_level)
		if @current_user && @current_user.user_level >= auth_level
		return true		
		else
		return false
		end
	end
	def get_user_from_url(url_full_name)
		first_last_array = url_full_name.split("_")
		first_name = first_last_array[0] 
		last_name = first_last_array[1] 
		@user = User.find(:first, :conditions => {:first_name => first_name, :last_name => last_name})
	end           
def drop_down_menu_list
	@drop_down_array = []
	@item_status = { 1 => "Waiting for approval", 
	 						2 => "For Sale", 
	 						3 => "On Sale",
	 						4 => "Processed",
	 						5 => "Closed" 
	 					 }
	 @item_status.each_pair {|k,v| @drop_down_array << [ v , k ]}
	 return @drop_down_array
	 end
	def item_status(numerical_status)
	 @item_status = { 1 => "Waiting for approval", 
	 						2 => "For Sale", 
	 						3 => "On Sale",
	 						4 => "Processed",
	 						5 => "Closed" 
	 					 }
	 return @item_status[numerical_status] 
	end

end
