class Blog::PostsController < ApplicationController
  inherit_resources
  actions :index, :show

  before_filter :validate_dates, only: 'show'
  skip_before_filter :set_locale
  
  layout 'blog'

  respond_to :html
  respond_to :atom, only: :index

  def show
    post = Post.includes(:author).find(params[:id])

    if params[:year].to_i != post.year.to_i || params[:month].to_i != post.month.to_i
      redirect_to post_path(post, year: post.year, month: post.month)
    else
      show!
    end
    
  end

  private

  def validate_dates
    raise ActiveRecord::RecordNotFound if params[:year] && params[:year].to_i < 2009
    raise ActiveRecord::RecordNotFound if params[:date] && !(1..12).include?(params[:month].to_i)
  end

  def collection
    validate_dates
    @posts = (params[:year] ? end_of_association_chain.from_archive(params[:year],params[:month])
                  : end_of_association_chain).page(params[:page]).published.ordered
    @posts.all
    @posts

  end

end
