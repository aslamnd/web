# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Rails.env.test? do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = FileList['spec/**/*_spec.rb']
  end
  task default: [:spec, :cucumber]
end

desc 'Update downloads for all open source projects'
task update_downloads: :environment do
  puts 'Updating downloads for all open source projects...'
  Project.open_source.each do |project|
    print "\t"
    print "* #{project.title}\t\t\t\t"
    project.update_downloads!
    print project.downloads
    print "\n"
  end
end

CodegramWeb::Application.load_tasks
