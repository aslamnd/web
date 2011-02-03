class PostsController < ApplicationController
  inherit_resources
  actions :index, :show

  layout 'blog', only: :index

  respond_to :html
  respond_to :atom, only: :index

  def show
    begin
      post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :file => "#{RAILS_ROOT}/public/404.html", :layout => '404', :status => 404
      reeturn
    end

    if params[:year].to_i != post.year.to_i ||
         params[:month].to_i != post.month.to_i
      redirect_to post_path(post, year: post.year, month: post.month)
    else
      show!
    end
  end

  private

  def collection
    params[:year] ? end_of_association_chain.from_archive(params[:year],
                                                          params[:month])
                  : end_of_association_chain.scoped
  end
end
