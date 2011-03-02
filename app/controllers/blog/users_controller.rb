class Blog::UsersController < ApplicationController
  inherit_resources
  actions :show

  before_filter :set_cache_control, only: 'show'
  layout 'blog'
end
