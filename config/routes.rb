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
    resource :pages, :only => [:show], :controller => 'high_voltage/pages'
    resource :contact_forms,
      :path => 'contact',
      :only => [:new, :create],
      :path_names => {:new => '/'}
    match '/:id', :controller => 'high_voltage/pages', :action => :show
    resources :work_categories, :path => 'work', :only => [:index, :show]  do
      resources :projects, :only =>[:show], :path => '/'
    end
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "high_voltage/pages#show", :id => 'home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.

end
