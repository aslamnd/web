require 'spec_helper'

describe Api::PostsController do
  describe "routing" do
    it "recognizes and generates #create" do
      { post: api_posts_path }.should route_to(controller: 'api/posts', action: 'create')
    end
    it "does not recognize anything else" do
      { get: api_posts_path }.should route_to(controller: 'errors', action: 'not_found', api_path: 'api/posts')
    end
  end
end  
