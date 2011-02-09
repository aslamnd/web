require 'carrierwave/test/matchers'

describe ScreenshotUploader do
  include CarrierWave::Test::Matchers

  let (:path_to_file) do
    "spec/support/files/screenshot.png"
  end

  before do
    ScreenshotUploader.enable_processing = true
    @uploader = ScreenshotUploader.new(mock_model(Screenshot), :file)
    @uploader.store!(File.open(path_to_file))
  end

  after do
    ScreenshotUploader.enable_processing = false
  end

  context 'the big version' do
    it "should scale down a landscape image to be exactly 715 by 302 pixels" do
      @uploader.big.should have_dimensions(715, 302)
    end
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 345 by 171 pixels" do
      @uploader.thumb.should have_dimensions(345, 171)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0600)
  end
end
