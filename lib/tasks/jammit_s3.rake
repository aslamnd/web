desc 'Performs jammit s3 on amazon'
task jammit_s3: :environment do
  vars = JSON.parse `bundle exec heroku rake heroku_env`.split("\n").last

  options = []
  vars.each_pair do |key, value|
    if value
      options << [key, value]
    end
  end

  command = options.collect{ |o| o.join('=') }.join(' ')
  IO.popen("#{command} bundle exec jammit-s3"){ |line|
    puts line
  }

end
