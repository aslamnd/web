CodegramWeb::Application.routes.draw do
  devise_for :users

  # Admin sections
  namespace :admin do
    resources :posts
    match '/' => 'dashboards#show'
  end

  # Public sections
  constraints subdomain: 'blog' do
    match '/' => 'posts#index'
    match '/:year/:month/:id' => 'posts#show'
  end

  constraints BaseSubdomain do
    resource :pages, :controller => 'high_voltage/pages'
  end

<<<<<<< HEAD
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  resource :contact, :controller => 'contact_forms',
    :only => [:new, :create],
    :path_names => {:new => '/'}

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "high_voltage/pages#show", :id => 'home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match '/:id', :controller => 'high_voltage/pages', :action => :show
=======
  root :to => "high_voltage/pages#show", :id => 'home'

>>>>>>> feature/posts
end
