CodegramWeb::Application.routes.draw do
  devise_for :users

  # Admin sections
  namespace :admin do
    resources :posts
    match '/' => 'dashboards#show', via: :get
  end

  # Public sections
  constraints subdomain: 'blog' do
    constraints format: :html do
      match '/' => 'posts#index', as: :blog, via: :get
      match '(/:year)(/:month)' => 'posts#index', as: :posts, via: :get
      resources :posts, { path: '/:year/:month', only: :show }
    end
    match '/feed.atom' => 'posts#index', as: :feed, via: :get, format: :atom
  end

  constraints BaseSubdomain do
    resource :pages, :controller => 'high_voltage/pages'
    resource :contact, :controller => 'contact_forms',
      :only => [:new, :create],
      :path_names => {:new => '/'}
    match '/feed.atom' => redirect('http://blog.codegram.com/feed.atom', status: 302)
    match '/:id', :controller => 'high_voltage/pages', :action => :show
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  root :to => "high_voltage/pages#show", :id => 'home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.

end
