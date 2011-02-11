class ProjectsController < ApplicationController

  before_filter :validate_category!
  before_filter :load_categories
  before_filter :set_cache_control

  def show
    @projects = Project.where(category: params[:work_category_id]).order('created_at DESC').all
    @project = params[:id] ? @projects.detect{|project| project.to_param == params[:id]} : @projects.first
    @index = @projects.index(@project) and begin
      @previous = @projects[@index - 1] if @index > 0
      @next = @projects[@index + 1] if @index <= @projects.length
    end
  end

  private

  def validate_category!
    raise ActiveRecord::RecordNotFound unless WorkCategory.names.include?(params[:work_category_id])
    raise ActiveRecord::RecordNotFound if params[:work_category_id] == 'client'
  end

  def load_categories
    @categories = WorkCategory.all[1..2]
    @active = params[:work_category_id]
  end

end
