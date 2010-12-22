require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def test_that_we_can_create_a_valid_order
  	order = Order.new(
  		#Contact Information
  		:email => 'abcdefg@gmail.com',
  		:phone_number => "4155044070",
  		#Shipping Address
  		:ship_to_first_name => 'Hallon',
  		:ship_to_last_name => 'Shaft',
  		:ship_to_address => 'street',
  		:ship_to_city => 'City',
  		:ship_to_postal_code => "99336",
  		:ship_to_country => 'USA',
  		#Billing Informaiton
		:card_type => "Visa",
  		:card_number => "400700000000027",
  		:card_expiration_month => '1',
  		:card_expiration_year => "2009",
  		:card_verification_value => "333"
  		)
  	order.customer_ip = "10.0.0.1"
  	order.status = "processed"
  	order.order_items << OrderItem.new(
  		:book_id => 1,
  		:price => 100.666,
  		:amount => 13
  		)
  		
  	assert order.save
  	
  	order.reload
  	
  	assert_equal 1, order.order_items.size
  	assert_equal 100.666, order.order_items[0].price
  	
end
