Factory.define :post do |p|
  p.title { Faker::Company.catch_phrase }
  p.tagline { "#{Faker::Company.catch_phrase}, built on top of #{Faker::Company.catch_phrase.tap {|n| n[0] = n[0].downcase }}" }
  p.body { Faker::Lorem.paragraphs.join("\n") }
  p.association :author
  p.published { true }
end
