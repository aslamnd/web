Factory.define :project do |p|
  p.title { Faker::Company.name }
  p.url { "http://www.#{Faker::Internet.domain_name}" }

  p.quote { "Probably the best #{Faker::Company.catch_phrase} since #{Faker::Name.name} launched his #{Faker::Company.catch_phrase}" }
  p.client_name { Faker::Name.name }

  p.description { Faker::Lorem.paragraph }
  p.extended_description { Faker::Lorem.paragraph }

  p.rubygem { %w(date_validator colorant colorblind lastfm).sample }

  p.category { WorkCategory.sample }
  p.screenshots { [Factory(:screenshot)] }
end

Factory.define :project_without_screenshot, parent: :project do |p|
  p.screenshots { [] }
end
