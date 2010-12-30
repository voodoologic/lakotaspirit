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
	

end
