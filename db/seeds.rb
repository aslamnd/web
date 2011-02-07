# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
# Blog seeds

oriol = Factory(:user, name: 'Oriol Gual', email: 'oriol@codegram.com')
oriol.user_tokens << UserToken.new(user: oriol, provider: 'twitter', uid: '128157474')
oriol.save

txus = Factory(:user, name: 'Josep M. Bach', email: 'txus@codegram.com')
txus.user_tokens << UserToken.new(user: txus, provider: 'twitter', uid: '6895722')
txus.save

josepjaume = Factory(:user, name: 'Josep Jaume Rey', email: 'josepjaume@codegram.com')
josepjaume.user_tokens << UserToken.new(user: josepjaume, provider: 'twitter', uid: '6965262')
josepjaume.save

marc = Factory(:user, name: 'Marc Riera', email: 'marc@codegram.com')
marc.user_tokens << UserToken.new(user: marc, provider: 'twitter', uid: '15055477')
marc.save

roger = Factory(:user, name: 'Roger Bacardit', email: 'roger@codegram.com')
roger.user_tokens << UserToken.new(user: roger, provider: 'twitter', uid: '7086462')
roger.save

unless Rails.env.production?

  user = User.find_by_email('txus@codegram.com') || Factory(:user, name: 'Josep M. Bach', email: 'txus@codegram.com')
  stendhal_post = Factory(:post,
                          title: 'Stendhal 0.1.2 released',
                          body: File.read('db/seeds/stendhal.md'),
                          created_at: Date.parse('2010-10-31'),
                          author: user)

  hijacker_post = Factory(:post,
                           title: 'Introducing hijacker: spy on your ruby objects!',
                           body: File.read('db/seeds/hijacker.md'),
                           created_at: Date.parse('2010-11-21'),
                           author: user)

  micetrap_post = Factory(:post,
                          title: 'Micetrap: catch evil hackers on the fly',
                          body: File.read('db/seeds/micetrap.md'),
                          created_at: Date.parse('2011-01-06'),
                          author: user)

  6.times do
    Factory(:project)
  end
  6.times do
    Factory(:project_without_screenshot)
  end
end
