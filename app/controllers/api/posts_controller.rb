class Api::PostsController < ApplicationController
  before_filter :authenticate_token!

  def create
    post = Post.new(params[:post])
    if post.save
      head :created, location: admin_post_path(post)
    else
      head 400, { errors: post.errors.to_json }
    end
  end

  protected

  def authenticate_token!
    user = User.where(api_token: params[:token]).first
    if user
      params[:post][:author_id] = user.id
      params[:post][:published] = false
      params.delete(:token)
    else
      permission_denied
    end
  end

  def permission_denied
    head :unauthorized
  end

end
