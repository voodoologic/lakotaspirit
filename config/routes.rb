ActionController::Routing::Routes.draw do |map|
  map.resources :payment_notifications

  map.resources :user_sessions

  map.resources :pages

  map.resources :users

  map.resource :session
  map.resources :items, :member => { :approve => :post }  
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.category '/browse/category/:category', :controller => "browse", :action => "category"   
  map.artist '/browse/artists/:url_full_name', :controller => "browse", :action => "artists" 
  map.admin '/admin/index', :controller => "admin/orders", :action => "index"
  map.seller '/seller/index', :controller => "seller/orders", :action => "index"
  map.adminOrder '/admin/order', :controller => 'admin/orders', :action => "index"
  map.adminItems '/admin/items', :controller => 'admin/items', :action => 'index'
  #experimental 

	#mapping new user since scaffold doesn't seem to be set up.
	


  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.root :controller => "browse", :action => 'index'
  map.view_page ':name', :controller => 'viewer', :action => 'show'

end
