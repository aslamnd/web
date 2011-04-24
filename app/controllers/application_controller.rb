class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  unless Rails.env.development?
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :not_found
  end

private

  def set_locale
    locale =
      if !params[:locale].blank?
        params[:locale]
      elsif session && !session[:locale].blank?
        session[:locale]
      elsif request.headers['HTTP_ACCEPT_LANGUAGE']
        request.headers['HTTP_ACCEPT_LANGUAGE'].split(',')[0].split('-')[0]
      end

    if ['ca', 'es', 'en'].include? locale
      I18n.locale = locale
    else
      I18n.locale = 'en'
    end
    session[:locale]=I18n.locale.to_s
  end

  def not_found(error)
    @error = get_data_for_error 
    render :template => 'errors/not_found',
      :layout => 'error',
      :status => 404
  end

  def get_data_for_error
    {:url => request.url}
  end

  def after_sign_in_path_for(resource_or_scope)
    admin_path
  end

end
