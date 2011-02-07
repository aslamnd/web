class ErrorsController < ApplicationController
  layout 'error'

  def not_found
    @error = get_data_for_error
    render :status => 404
  end

end
