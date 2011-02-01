require 'spec_helper'

describe HighVoltage::PagesController do
  describe "routing" do
    it "recognizes and generates #home as root" do
      { :get => "/" }.should route_to(controller: 'high_voltage/pages', action: 'show', id: 'home')
    end
  end  
end
