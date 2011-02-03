class Admin::PostsController < Admin::ApplicationController
  inherit_resources

  def create
    params[:post][:author] = current_user
    create! { admin_posts_path }
  end

  def update
    update! { admin_posts_path }
  end

end
