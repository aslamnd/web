require 'spec_helper'

describe ProjectsHelper do
  let(:project) { mock_model(Project) }

  describe "#big_screenshot_for(project)" do

    context 'if the project has a screenshot' do
      it 'renders an image tag with the screenshot' do
        screenshot = double :screenshot
        project.stub(:screenshot).and_return screenshot
        screenshot.stub_chain('file.big.url').and_return '/big_screenshot.jpg'

        big_screenshot_for(project).should =~ /big_screenshot\.jpg/
        big_screenshot_for(project).should_not =~ /fallback/
      end
    end

    context 'otherwise' do
      it 'renders the fallback image' do
        project.stub(:screenshot).and_return nil

        big_screenshot_for(project).should =~ /fallback\/big_screenshot\.jpg/
      end
    end

  end

  describe "#thumb_screenshot_for(project)" do

    context 'if the project has a screenshot' do
      it 'renders an image tag with the screenshot' do
        screenshot = double :screenshot
        project.stub(:screenshot).and_return screenshot
        screenshot.stub_chain('file.thumb.url').and_return '/thumb_screenshot.jpg'

        thumb_screenshot_for(project).should =~ /thumb_screenshot\.jpg/
        thumb_screenshot_for(project).should_not =~ /fallback/
      end
    end

    context 'otherwise' do
      it 'renders the fallback image' do
        project.stub(:screenshot).and_return nil

        thumb_screenshot_for(project).should =~ /fallback\/thumb_screenshot\.jpg/
      end
    end

  end

end
