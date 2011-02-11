desc 'Performs jammit s3 on amazon'
task jammit_s3: :environment do
  vars = JSON.parse `heroku rake heroku_env`.split("\n").last
  command = vars.to_a.collect do |pair, output|
    pair.join("=")
  end.join(" ")
  puts command
end
