desc 'Update downloads for all open source projects'
task heroku_env: :environment do
  %w{HOPTOAD_KEY SESSION_STORE_KEY S3_SECRET S3_BUCKET TWITTER_KEY TWITTER_SECRET}.each do |var|
    puts "#{var}=#{ENV[var]}"
  end
end
