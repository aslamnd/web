CodegramWeb::Application.routes.draw do
  devise_for :users

  # Admin sections
  namespace :admin do
    resources :posts
    match '/' => 'dashboards#show', via: :get
  end

  # Public sections
  
  ## Blog subdomain
  constraints subdomain: 'blog' do
    constraints format: :html do
      match '/' => 'posts#index', as: :blog, via: :get
      match '(/:year)(/:month)' => 'posts#index', as: :posts, via: :get
      resources :posts, { path: '/:year/:month', only: :show }
    end
    match '/feed.atom' => 'posts#index', as: :feed, via: :get, format: :atom
  end

  ## Base subdomain
  constraints BaseSubdomain do
    resource :pages, :only => [:show], :controller => 'high_voltage/pages'
    resource :contact_form,
      :path => 'contact',
      :only => [:new, :create],
      :path_names => {:new => '/'}
    match '/feed.atom' => redirect("http://blog.codegram.com/feed.atom", status: 301)
    match '/:id', :controller => 'high_voltage/pages', :action => :show
    resources :work_categories, :path => 'work', :only => [:index, :show]  do
      resources :projects, :only =>[:show], :path => '/'
    end
  end

  root :to => "high_voltage/pages#show", :id => 'home'

end
