module ItemsHelper
	def user_selection
		f.collection_select :user_id, User.all,:id, :name, :include_blank => true
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
