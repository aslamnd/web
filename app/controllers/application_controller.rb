class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  rescue_from ActiveRecord::RecordInvalid, :with => :not_found
  rescue_from StandardError, :with => :standard_error

private

  def not_found(error)
    @error = get_data_for_error 
    render :template => 'errors/not_found',
      :layout => 'error',
      :status => 404
  end

  def standard_error(error)
    render :template => 'errors/not_found',
      :layout => 'error',
      :status => 500
  end

  def get_data_for_error
    {:url => request.url}
  end

end
