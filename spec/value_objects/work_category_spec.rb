require 'spec_helper'

describe WorkCategory do
  describe 'attributes' do
    it { should respond_to(:name) }
  end
  describe 'delegations' do
    it { should delegate(:first).to(:names) }
    it { should delegate(:each).to(:names) }
    it { should delegate(:sample).to(:names) }
    it { should delegate(:last).to(:names) }
  end

  describe ".[]" do
    it 'returns the humanized name' do
      subject['open-source'].should == 'Open Source'
      subject['products'].should == 'Products'
    end
  end

  describe ".names" do
    it 'returns the category names' do
      subject.names.should =~ %w(client products open-source)
    end
  end

  describe ".all" do
    it 'returns the category objects' do
      subject.all.each do |object|
        object.should respond_to(:name)
        object.should respond_to(:id)
      end
    end
  end

end
