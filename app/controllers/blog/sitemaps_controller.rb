class Blog::SitemapsController < ApplicationController

  before_filter :set_cache_control

  def show
    @posts = Post.ordered
    headers["Content-Type"] = 'text/xml'
  end

end
