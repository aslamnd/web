require 'spec_helper'

describe Screenshot do
  it { should respond_to(:file) }
  it { should belong_to(:project) }
  it { should validate_presence_of(:file) }

  describe "callbacks" do
    describe "#after_destroy" do
      it 'ensures files are deleted' do
        screenshot = Factory(:screenshot)

        screenshot.should_receive(:remove_file!)
        screenshot.destroy
      end
    end
    
  end
end
