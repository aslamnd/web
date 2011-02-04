require 'spec_helper'

describe Project do
  describe "attributes" do
    it { should respond_to(:title, :quote, :client_name, :url) }
    it { should respond_to(:description, :extended_description) }
    it { should respond_to(:category, :promoted) }
    it { should respond_to(:downloads) }
  end
end
