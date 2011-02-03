# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
# Blog seeds

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
