Factory.define :post do |p|
  p.title { Faker::Company.catch_phrase }
  p.body { Faker::Lorem.paragraphs.join("\n") }
  p.association :author
end
