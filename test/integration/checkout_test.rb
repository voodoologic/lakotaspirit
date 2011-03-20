require 'test_helper'

class CheckoutTest < ActionController::IntegrationTest
  fixtures :all

  # Replace this with your real tests.
  def test_that_empty_cart_shows_error_message
  	get "/checkout"
  	assert_response :redirect
  	assert_redirected_to :controller => "catalog"
  	assert_equal "Your shopping cart is empty! Please add something to it before proceeding to checkout.", flash[:notice]
  end
  
end
