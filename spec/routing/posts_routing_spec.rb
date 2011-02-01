require 'spec_helper'

describe PostsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { get: posts_path }.should route_to(controller: 'posts', action: 'index')
    end

    it "recognizes and generates #show" do
      { get: post_path(1) }.should route_to(controller: 'posts', action: 'show', id: '1')
    end

    it "does not recognize #new" do
      expect {
        { get: new_post_path }
      }.to raise_error
    end

    it "does not recognize #edit" do
      expect {
        { get: edit_post_path(1) }
      }.to raise_error
    end

    it "does not recognize #create" do
      { post: posts_path }.should_not be_routable
    end

    it "does not recognize #update" do
      { put: post_path(1) }.should_not be_routable
    end

    it "does not recognize #destroy" do
      { delete: post_path(1) }.should_not be_routable
    end
  end
end  
