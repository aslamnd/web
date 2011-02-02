Factory.define :post do |p|
  p.title { Faker::Company.catch_phrase }
  p.body { Faker::Lorem.paragraphs }
  p.association :author
end
