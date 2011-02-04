class Admin::ProjectsController < Admin::ApplicationController
  inherit_resources

  before_filter :load_categories, only: [:new, :edit]

  def create
    create! { admin_projects_path }
  end

  def update
    update! { admin_projects_path }
  end

  private
  
  def load_categories
    @categories = WorkCategory.all
  end

end
