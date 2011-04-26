require 'spec_helper'

describe Api::PostsController do
  describe "routing" do
    it "recognizes and generates #create" do
      { post: '/api/posts' }.should route_to(controller: 'api/posts', action: 'create')
    end
    it "recognizes and generates #index" do
      { get: '/api/posts' }.should route_to(controller: 'api/posts', action: 'index')
    end
  end
end  
