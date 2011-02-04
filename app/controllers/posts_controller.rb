class PostsController < ApplicationController
  inherit_resources
  actions :index, :show

  layout 'blog'

  respond_to :html
  respond_to :atom, only: :index

  def show
    post = Post.find(params[:id])
    if params[:year].to_i != post.year.to_i ||
         params[:month].to_i != post.month.to_i
      redirect_to post_path(post, year: post.year, month: post.month)
    else
      show!
    end
    
  end

  private

  def collection
    (params[:year] ? end_of_association_chain.from_archive(params[:year],
                                                          params[:month])
                  : end_of_association_chain.scoped).paginate(page: params[:page], per_page: 5)
  end
end
