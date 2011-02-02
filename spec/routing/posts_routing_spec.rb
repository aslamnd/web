require 'spec_helper'

describe PostsController do
  describe "routing" do
    it "recognizes and generates #index" do
      pending "Testing routes with subdomains is a bit tricky by now!"
      { get: '/', subdomain: 'blog' }.should route_to(controller: 'posts', action: 'index')
    end

    it "recognizes and generates #show" do
      pending "Testing routes with subdomains is a bit tricky by now!"
    end
  end
end  
