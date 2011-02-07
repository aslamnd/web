class ProjectsController < ApplicationController

  before_filter :validate_category!
  before_filter :load_categories

  def show
    @projects = Project.where(category: params[:work_category_id]).order('created_at DESC')
    @project = params[:id] ? Project.find(params[:id]) : @projects.first
    index = @projects.index(@project)
    @previous = @projects[index - 1] if index > 0
    @next = @projects[index + 1] if index <= @projects.count
  end

  private

  def validate_category!
    raise ActiveRecord::RecordNotFound unless WorkCategory.names.include?(params[:work_category_id])
  end

  def load_categories
    @categories = WorkCategory.all
    @active = params[:work_category_id]
  end

end
