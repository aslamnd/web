require 'spec_helper'

describe Project do
  describe "attributes" do
    it { should respond_to(:title, :quote, :client_name, :url) }
    it { should respond_to(:description, :extended_description) }
    it { should respond_to(:category, :promoted) }
    it { should respond_to(:downloads) }
  end
  describe 'relations' do
    it { should have_many(:screenshots) }
  end
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:extended_description) }

    it { should validate_presence_of(:category) }

    WorkCategory.each do |category|
      it { should allow_value(category).for(:category) }
    end

    it { should_not allow_value('other-work').for(:category) }
    it { should_not allow_value('microsoft').for(:category) }
  end
end
