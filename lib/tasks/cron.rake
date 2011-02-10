desc 'Update downloads for all open source projects'
task cron: :environment do
  puts 'Updating downloads for all open source projects...'
  Project.open_source.each do |project|
    print "\t"
    print "* #{project.title}\t\t\t\t"
    project.update_downloads!
    print project.downloads
    print "\n"
  end
end
