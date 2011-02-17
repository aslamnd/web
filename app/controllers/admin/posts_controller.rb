class Admin::PostsController < Admin::ApplicationController
  inherit_resources

  def create
    params[:post][:author] = current_user
    create! { admin_posts_path }
  end

  def edit
    @post = Post.unscoped.find(params[:id])
    edit!
  end

  def update
    @post = Post.unscoped.find(params[:id])
    update! { admin_posts_path }
  end

  protected

  def collection
    end_of_association_chain.unscoped
  end
end
