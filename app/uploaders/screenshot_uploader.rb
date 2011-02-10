# encoding: utf-8
class ScreenshotUploader < CarrierWave::Uploader::Base
  permissions 0600
  # Include RMagick or ImageScience support:
  include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :s3
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    path = File.join(*("%08d" % model.id).scan(/..../))
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{path}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    "/images/fallback/" + [version_name, "screenshot.jpg"].compact.join('_')
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :big do
    process :resize_to_fill => [715, 302]
  end

  version :thumb do
    process :resize_to_fill => [345, 171]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # def filename
  #   "something.jpg" if original_filename
  # end

end
