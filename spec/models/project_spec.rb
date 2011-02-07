require 'spec_helper'

describe Project do
  describe "attributes" do
    it { should respond_to(:title, :quote, :client_name, :url) }
    it { should respond_to(:description, :extended_description) }
    it { should respond_to(:category, :promoted) }
    it { should respond_to(:rubygem, :downloads) }
    it { should accept_nested_attributes_for(:screenshots) }
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

  describe "scopes" do
    describe ".open_source" do
      it 'returns open source projects' do
        open_source_project = Factory.create :project, category: 'open-source'
        client_project = Factory.create :project, category: 'client'
        Project.open_source.all.should == [open_source_project]
      end
    end
  end

  describe "#screenshot" do
    it 'returns the first screenshot' do
      screenshot = double('screenshot')
      subject.screenshots.should_receive(:first).and_return screenshot
      subject.screenshot == screenshot
    end
  end

  describe "#update_downloads!" do
    it 'updates the :downloads attribute with info from RubygemsFetcher' do
      result = double :result
      subject.stub(:rubygem).and_return 'date_validator'

      RubygemsFetcher.should_receive(:get).with(:downloads, 'date_validator').and_return result
      subject.should_receive(:update_attribute).with(:downloads, result)

      subject.update_downloads!
    end
  end
end
