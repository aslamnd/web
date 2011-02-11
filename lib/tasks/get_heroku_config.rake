desc 'Gets all heroku variables in json format'
task heroku_env: :environment do
  vars = Hash.new
  %w{HOPTOAD_KEY SESSION_STORE_KEY S3_SECRET S3_BUCKET TWITTER_KEY TWITTER_SECRET}.each do |var|
    vars[var.to_sym] = ENV[var]
  end
  puts vars.to_json
end
