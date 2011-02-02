require 'spec_helper'

describe Admin::PostsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { get: admin_posts_path }.should route_to(controller: 'admin/posts', action: 'index')
    end

    it "recognizes and generates #show" do
      { get: admin_post_path(1) }.should route_to(controller: 'admin/posts', action: 'show', id: '1')
    end

    it "recognizes and generates #new" do
      { get: new_admin_post_path }.should route_to(controller: 'admin/posts', action: 'new')
    end

    it "recognizes and generates #edit" do
      { get: edit_admin_post_path(1) }.should route_to(controller: 'admin/posts', action: 'edit', id: '1')
    end

    it "recognizes and generates #create" do
      { post: admin_posts_path }.should route_to(controller: 'admin/posts', action: 'create')
    end

    it "recognizes and generates #update" do
      { put: admin_post_path(1) }.should route_to(controller: 'admin/posts', action: 'update', id: '1')
    end

    it "recognizes and generates #destroy" do
      { delete: admin_post_path(1) }.should route_to(controller: 'admin/posts', action: 'destroy', id: '1')
    end
  end
end  
