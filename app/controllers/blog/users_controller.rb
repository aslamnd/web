class Blog::UsersController < ApplicationController
  inherit_resources
  actions :show

  layout 'blog'
end
