desc 'Performs jammit s3 on amazon'
task jammit_s3: :environment do
  vars = JSON.parse `bundle exec heroku rake heroku_env`.split("\n").last
  Jammit.upload_to_s3!(
    :bucket_name => vars['BUCKET_NAME'],
    :access_key_id => vars['S3_KEY'],
    :secret_access_key => vars['S3_SECRET']
  )
end
