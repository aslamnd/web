# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
# Blog seeds

unless oriol = User.find_by_name('Oriol Gual')
  oriol = Factory(:user, name: 'Oriol Gual', email: 'oriol@codegram.com', position: 'Lead developer', github: 'oriolgual', twitter: 'oriolgual', homepage: 'http://oriolgual.me')
  oriol.user_tokens << UserToken.new(user: oriol, provider: 'twitter', uid: '128157474')
  oriol.save
end

unless txus = User.find_by_name('Josep M. Bach')
  txus = Factory(:user, name: 'Josep M. Bach', email: 'txus@codegram.com', position: 'Lead developer', github: 'txus', twitter: 'txustice', homepage: 'http://txustice.me')
  txus.user_tokens << UserToken.new(user: txus, provider: 'twitter', uid: '6895722')
  txus.save
end

unless josepjaume = User.find_by_name('Josep Jaume Rey')
  josepjaume = Factory(:user, name: 'Josep Jaume Rey', email: 'josepjaume@codegram.com', position: 'Lead developer', github: 'josepjaume', twitter: 'josepjaume', homepage: '')
  josepjaume.user_tokens << UserToken.new(user: josepjaume, provider: 'twitter', uid: '6965262')
  josepjaume.save
end

unless marc = User.find_by_name('Marc Riera')
  marc = Factory(:user, name: 'Marc Riera', email: 'marc@codegram.com', position: 'Front-end developer', github: 'mrc2407', twitter: 'mrc2407', homepage: 'http://nuvolsgratis.cat')
  marc.user_tokens << UserToken.new(user: marc, provider: 'twitter', uid: '15055477')
  marc.save
end

unless roger = User.find_by_name('Roger Bacardit')
  roger = Factory(:user, name: 'Roger Bacardit', email: 'roger@codegram.com', position: 'Lead designer', github: '', twitter: 'ruxii', homepage: '')
  roger.user_tokens << UserToken.new(user: roger, provider: 'twitter', uid: '7086462')
  roger.save
end


unless Rails.env.production?

  stendhal_post = Factory(:post,
                          title: 'Stendhal 0.1.2 released',
                          body: File.read('db/seeds/stendhal.md'),
                          created_at: Date.parse('2010-10-31'),
                          published: true,
                          author: txus)

  hijacker_post = Factory(:post,
                           title: 'Introducing hijacker: spy on your ruby objects!',
                           body: File.read('db/seeds/hijacker.md'),
                           created_at: Date.parse('2010-11-21'),
                           published: true,
                           author: josepjaume)

  micetrap_post = Factory(:post,
                          title: 'Micetrap: catch evil hackers on the fly',
                          body: File.read('db/seeds/micetrap.md'),
                          created_at: Date.parse('2011-01-06'),
                          published: true,
                          author: oriol)

  micetrap_post = Factory(:post,
                          title: 'Micetrap: catch evil hackers on the fly',
                          body: File.read('db/seeds/micetrap.md'),
                          created_at: Date.parse('2011-01-06'),
                          published: true,
                          author: marc)

  micetrap_post = Factory(:post,
                          title: 'Micetrap: catch evil hackers on the fly',
                          body: File.read('db/seeds/micetrap.md'),
                          created_at: Date.parse('2011-01-06'),
                          published: true,
                          author: roger)


  6.times do
    Factory(:project, :published => true)
  end
  Factory(:project, :promoted => true, :published => true)
  Factory(:project, :promoted => true, :published => false)
  Factory(:project, :published => false)
end
