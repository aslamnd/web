CodegramWeb::Application.routes.draw do
  devise_for :users

  # Admin sections
  namespace :admin do
    resources :posts
  end

  # Public sections
  resources :posts, :only => [:index, :show]

  resource :pages, :controller => 'high_voltage/pages'

  root :to => "high_voltage/pages#show", :id => 'home'

end
