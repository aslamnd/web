class PostsController < ApplicationController
  inherit_resources
  actions :index, :show

  # TODO: RSS for index pages
  
  # TODO: 404 if post not found
  def show
    post = Post.find(params[:id])

    if params[:year].to_i != post.year.to_i ||
         params[:month].to_i != post.month.to_i
      redirect_to post_path(post, year: post.year, month: post.month)
    else
      show!
    end
  end
end
