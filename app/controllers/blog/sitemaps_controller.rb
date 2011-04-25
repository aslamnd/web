class Blog::SitemapsController < ApplicationController

  def show
    @posts = Post.ordered
    headers["Content-Type"] = 'text/xml'
  end

end
