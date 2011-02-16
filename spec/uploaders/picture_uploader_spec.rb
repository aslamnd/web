require 'carrierwave/test/matchers'

describe PictureUploader do
  include CarrierWave::Test::Matchers

  let (:path_to_file) do
    "spec/support/files/screenshot.png"
  end

  before do
    PictureUploader.enable_processing = true
    @uploader = PictureUploader.new(mock_model(Post), :file)
    @uploader.store!(File.open(path_to_file))
  end

  after do
    PictureUploader.enable_processing = false
  end

  context 'the thumb version' do
    it "should scale down a square image to fit within 160 by 160 pixels" do
      @uploader.thumb.should be_no_larger_than(160, 160)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0600)
  end
end
