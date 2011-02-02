class Admin::ApplicationController < ::ApplicationController
  before_filter :authenticate_user!

  # TODO: Remove this when Rails 3.1 is available, thanks to view inheritance
  layout 'admin/layouts/application'
end
