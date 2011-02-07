class PagesController < HighVoltage::PagesController
  before_filter :set_cache_control

private

  def set_cache_control
    if Rails.env.production?
      expires_in 24.hours, :public => true unless user_signed_in?
    end
  end

end
