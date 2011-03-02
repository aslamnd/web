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
    describe ".promoted" do
      it 'returns published and promoted projects' do
        promoted_project = Factory.create :project, promoted: true, published: true
        Factory.create :project, promoted: true, published: false
        Factory.create :project, promoted: false, published: true
        Project.promoted.all.should == [promoted_project]
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

  describe "#open_source?" do
    context 'if the project is open source' do
      it 'returns true' do
        subject.stub(:category).and_return 'open-source'
        subject.should be_open_source
      end
    end
    context 'otherwise' do
      it 'returns false' do
        subject.stub(:category).and_return 'client'
        subject.should_not be_open_source
      end
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

  describe "#normalize_friendly_id", "preprocesses friendly_ids" do
    context 'if the project has a rubygem' do
      it 'returns the rubygem name' do
        project = Project.new rubygem: 'acts_as_decimal'
        project.normalize_friendly_id('Easy acts as decimal').should == 'acts_as_decimal'
      end
    end
    context 'otherwise' do
      it 'returns the same name' do
        project = Project.new rubygem: nil
        project.normalize_friendly_id('Easy acts as decimal').should == 'easy-acts-as-decimal'
      end
    end
  end

  describe "class methods" do
    describe ".update_downloads!" do
      it 'calls #update_downloads! for every open source project' do
        colorblind = double :colorblind
        markdownizer = double :markdownizer
        [colorblind, markdownizer].each do |project|
          project.should_receive(:update_downloads!)
        end

        Project.stub(:open_source).and_return [colorblind, markdownizer]
        Project.update_downloads!
      end
    end
  end
end
