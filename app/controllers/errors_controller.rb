class ErrorsController < ApplicationController
  layout 'error'

  def not_found
    @error = get_data_for_error
    render :status => 404
  end

  def standard_error
    render :status => 500
  end

end
