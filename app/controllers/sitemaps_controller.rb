class SitemapsController < ApplicationController

  before_filter :set_cache_control

  def show
    headers["Content-Type"] = 'text/xml'
  end


end
