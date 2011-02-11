CarrierWave.configure do |config|
  config.fog_credentials = {
    :aws_access_key_id => ENV['S3_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET'],
    :provider => 'AWS',
    :region => 'eu-west-1'
  }
  config.fog_directory = 'codegram-web'
  config.fog_public = true
  config.fog_attributes = {
    'Cache-Control' => "public, max-age=#{2.weeks}"
  }
end
