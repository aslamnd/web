class SitemapsController < ApplicationController

  def show
    headers["Content-Type"] = 'text/xml'
  end

end
