class PostsController < ApplicationController
  inherit_resources
  actions :index, :show

  def show
    post = Post.find(params[:id])

    if params[:year].to_i != post.year.to_i ||
         params[:month].to_i != post.month.to_i
      redirect_to "/#{post.year}/#{post.month}/#{post.friendly_id}"
    else
      show!
    end
  end
end
