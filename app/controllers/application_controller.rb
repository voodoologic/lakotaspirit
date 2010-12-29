# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
#require 'restful_authentication'

	helper_method :current_user, :authorized
	before_filter :get_pages_for_tabs, :initialize_cart, :shopping_navbar
	
	
	private
	
	def current_user_session
		return @current_user_session if defined?(@current_user_session)
		@current_user_session = UserSession.find
	end
	
	def current_user
		return @current_user if defined?(@current_user)
		@current_user = current_user_session && current_user_session.record
	end
	
	def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end 
  def store_location
  	session[:return_to] =
 	 if request.get?
  	  request.request_uri
	 else
   	request.referer
  	 end
  end
  def get_pages_for_tabs
  		if current_user
  			@tabs = Page.find(:all)
  		else
  			@tabs = Page.find(:all, :conditions => ["admin != ?", true])
  		end
  end
  #this is for generating the jewelry /types/ 
	def shopping_navbar
		@shopping_navbar = Item.all.collect{|x| x.category.downcase}.uniq
	end
  def initialize_cart
		if session[:cart_id]
			@cart = Cart.find(session[:cart_id])
			#session[:cart_id] = nil @cart.purchased_at
		end
		if session[:cart_id].nil?	
			@cart = Cart.create
			session[:cart_id] = @cart.id
		end
		#	@cart
	
	  
  end

end
