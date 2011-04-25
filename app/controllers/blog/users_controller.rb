class Blog::UsersController < ApplicationController
  inherit_resources
  skip_before_filter :set_locale
  actions :show

  layout 'blog'
end
