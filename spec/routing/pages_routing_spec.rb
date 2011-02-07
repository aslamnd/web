require 'spec_helper'

describe PagesController do
  describe "routing" do
    it "recognizes and generates #home as root" do
      { :get => "/" }.should route_to(controller: 'pages', action: 'show', id: 'home')
    end
  end  
end
