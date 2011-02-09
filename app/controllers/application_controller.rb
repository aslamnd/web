class ApplicationController < ActionController::Base
  protect_from_forgery

  if true # Rails.env.production?
    rescue_from ActiveRecord::RecordNotFound, :with => :not_found
    rescue_from ActiveRecord::RecordInvalid, :with => :not_found
    rescue_from StandardError, :with => :standard_error
  end

private

  def not_found(error)
    @error = get_data_for_error 
    render :template => 'errors/not_found',
      :layout => 'error',
      :status => 404
  end

  def standard_error(error)
    logger.error(error)
    @error = get_data_for_error
    render :template => 'errors/standard_error',
      :layout => 'error',
      :status => 500
  end

  def get_data_for_error
    {:url => request.url}
  end

  def after_sign_in_path_for(resource_or_scope)
    admin_path
  end

  def set_cache_control
    if Rails.env.production?
      expires_in 24.hours, :public => true
    end
  end

end
