require 'spec_helper'

describe Api::PostsController do
  describe "routing" do
    it "recognizes and generates #create" do
      { post: '/api/posts' }.should route_to(controller: 'api/posts', action: 'create')
    end
    it "does not recognize anything else" do
      { get: '/api/posts' }.should route_to(controller: 'errors', action: 'not_found', path: 'api/posts')
    end
  end
end  
