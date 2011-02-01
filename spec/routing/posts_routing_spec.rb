require 'spec_helper'

describe PostsController do
  describe "routing" do
    pending "recognizes and generates #index" do
      { get: '/', subdomain: 'blog' }.should route_to(controller: 'posts', action: 'index')
    end

    pending "recognizes and generates #show" do
    end
  end
end  
