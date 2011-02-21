class Admin::ProjectsController < Admin::ApplicationController
  inherit_resources

  before_filter :load_categories, only: [:new, :edit]

  def create
    create! { admin_projects_path }
  end

  def edit
    @project = Project.unscoped.find(params[:id])
    edit!
  end

  def update
    @project = Project.unscoped.find(params[:id])
    update! { admin_projects_path }
  end

  def show
    @project = Project.unscoped.find(params[:id])
    show!
  end

  private
  
  def load_categories
    @categories = WorkCategory.all
  end

  protected 

  def collection
    Project.unscoped
  end

end
