class Api::PostsController < ApplicationController
  before_filter :authenticate_token!

  respond_to :json

  def create
    post = Post.new(params[:post])
    if post.save
      head :created, location: admin_post_path(post)
    else
      head 400, { errors: post.errors.to_json }
    end
  end

  def index
    respond_with @user.posts
  end

  protected

  def authenticate_token!
    @user = User.where(api_token: params[:token]).first
    permission_denied unless @user

    if params[:post]
      params[:post][:author_id] = @user.id
      params[:post][:published] = false
      params.delete(:token)
    end
  end

  def permission_denied
    head :unauthorized
  end

end
