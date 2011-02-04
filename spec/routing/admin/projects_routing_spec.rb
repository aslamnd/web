require 'spec_helper'

describe Admin::ProjectsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { get: admin_projects_path }.should route_to(controller: 'admin/projects', action: 'index')
    end

    it "recognizes and generates #show" do
      { get: admin_project_path(1) }.should route_to(controller: 'admin/projects', action: 'show', id: '1')
    end

    it "recognizes and generates #new" do
      { get: new_admin_project_path }.should route_to(controller: 'admin/projects', action: 'new')
    end

    it "recognizes and generates #edit" do
      { get: edit_admin_project_path(1) }.should route_to(controller: 'admin/projects', action: 'edit', id: '1')
    end

    it "recognizes and generates #create" do
      { post: admin_projects_path }.should route_to(controller: 'admin/projects', action: 'create')
    end

    it "recognizes and generates #update" do
      { put: admin_project_path(1) }.should route_to(controller: 'admin/projects', action: 'update', id: '1')
    end

    it "recognizes and generates #destroy" do
      { delete: admin_project_path(1) }.should route_to(controller: 'admin/projects', action: 'destroy', id: '1')
    end
  end
end  
