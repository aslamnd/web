desc 'Performs jammit s3 on amazon'
task jammit_s3: :environment do
  vars = JSON.parse `bundle exec heroku rake heroku_env`.split("\n").last
  config = {
    :bucket_name => vars['S3_BUCKET'],
    :access_key_id => vars['S3_KEY'],
    :secret_access_key => vars['S3_SECRET'],
    :cache_control => "c, max-age=31536000"
  }
  Jammit.upload_to_s3! config
end
