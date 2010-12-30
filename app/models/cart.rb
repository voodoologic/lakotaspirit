class Cart < ActiveRecord::Base
	has_many :cart_items
	has_many :items, :through => :cart_items
	def total
		cart_items.inject(0) {|sum, n| n.price * n.amount + sum}
	end
	def add(item_id)
		items = cart_items.find_all_by_item_id(item_id)
		item = Item.find(item_id)
		
		if items.size < 1
			ci = cart_items.create(:item_id => item_id,
											:amount => 1,
											:price => item.price)
		else
			ci = items.first
			if item.quantity > ci.amount 
				ci.update_attribute(:amount, ci.amount + 1)
			end
		end
		ci
	end	
	
	def remove(item_id)
		ci = cart_items.find_by_item_id(item_id)
		
		if ci.amount > 1
			ci.update_attribute(:amount, ci.amount - 1)
		else
			CartItem.destroy(ci.id)
		end
		return ci
	end
	###paypal magic ###
	def paypal_url(return_url)
		values = {
			:business => 'Seller_1286067248_biz@gmail.com',
			:cmd => '_cart',
			:upload => 1,
			:return_url => return_url,
			:invoice => id
		}
		cart_items.each_with_index do |item, index|
			values.merge!({
			"amount_#{index+1}" => item.price,
			"item_name_#{index+1}" => item.item.title,
			"item_number_#{index+1}" => item.item.quantity 
			})
		end
		"https://www.sandbox.paypal.com/cgi-bin/webscr?"+values.map {|k,v| "#{k}=#{v}"}.join("&")
	end
end
