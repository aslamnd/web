class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  unless Rails.env.development?
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :not_found
  end

private

  def default_url_options(options={})
    I18n.locale.to_s != 'en' ? { :locale => I18n.locale } : {}
  end

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

    if request.path == '/' && session[:locale] && I18n.locale != I18n.default_locale
      puts '---------------------------------'
      puts "Redirecto to '#{I18n.locale}'"
      redirect_to "/#{I18n.locale}"
      return false
    end
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
