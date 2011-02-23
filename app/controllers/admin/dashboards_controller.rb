class Admin::DashboardsController < Admin::ApplicationController

  before_filter :authenticate_user!
  def show
    @api_token = current_user.api_token
  end

end
