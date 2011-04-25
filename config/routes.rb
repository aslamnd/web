CodegramWeb::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'admin/omniauth_callbacks' }

  # Admin sections
  namespace :admin do
    resources :posts
    resources :projects
    match '/' => 'dashboards#show', via: :get
  end

  # Public sections
  
  ## Blog subdomain
  constraints subdomain: 'blog' do
    match '/en/2010/04/30/presenting-date-validator.html' => redirect('/2011/2/date-validation-with-rails-3', status: 301)
    match '/es/2010/04/29/presenting-date-validator.html' => redirect('/2011/2/date-validation-with-rails-3', status: 301)
    namespace :blog, path: '/' do
      resources :users, only: :show
      match '/sitemap.xml' => 'sitemaps#show'
      constraints format: :html do
        match '/' => 'posts#index', as: :blog, via: :get
        match '(/:year)(/:month)' => 'posts#index', as: :posts, via: :get
        resources :posts, { path: '/:year/:month', only: :show }
      end
    end
    match '/feed.xml' => 'blog/posts#index', as: :feed, via: :get, format: :atom
    match '/feed.atom' => redirect('http://feeds.feedburner.com/codegram', status: 301)
    match '*path' => 'errors#not_found'
  end


  ## Base subdomain
  constraints BaseSubdomain do

    match '/:locale' => 'pages#show', :id => 'home', :locale => /es/

    scope '(:locale)', :locale => /es/ do
      scope '/api' do
        scope '/posts' do
          get "/" => "api/posts#index"
          post "/" => "api/posts#create"
        end
      end

      resource :contact_form,
        :path => 'contact',
        :only => [:new, :create],
        :path_names => {:new => '/'}

      resources :projects, :only =>[:show], :path => '/work/:work_category_id'
      match '/work(/:work_category_id)', :controller => 'projects', :action => :show, work_category_id: 'products', via: :get, as: :work
      match '/feed.atom' => redirect("http://blog.codegram.com/feed.atom", status: 301)
      match '/services', :controller => 'pages', :action => :show, :id => 'services'
      match '/about', :controller => 'pages', :action => :show, :id => 'about'
      match '/sitemap.xml' => 'sitemaps#show'
      match '/what-we-do' => redirect('/services', status: 301)
      match '*path' => 'errors#not_found'
    end

    root :to => "pages#show", :id => 'home'
  end

  match '*path' => redirect("http://codegram.com/%{path}", status: 301)
  match '/' => redirect('http://codegram.com/', status: 301)
end
