require 'carrierwave/test/matchers'

describe AvatarUploader do
  include CarrierWave::Test::Matchers

  let (:path_to_file) do
    "spec/support/files/avatar.jpg"
  end

  before do
    AvatarUploader.enable_processing = true
    @uploader = AvatarUploader.new(mock_model(User), :file)
    @uploader.store!(File.open(path_to_file))
  end

  after do
    AvatarUploader.enable_processing = false
  end

  context 'the thumb version' do
    it "should scale down a landscape image to fit within 216 by 216 pixels" do
      @uploader.thumb.should be_no_larger_than(160, 80)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0600)
  end
end
