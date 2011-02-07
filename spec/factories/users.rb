Factory.define :user do |u|
  u.name { Faker::Name.name }
  u.sequence(:email) { |n| "user#{n}@codegram.com" }
  u.password 'admin123'
  u.password_confirmation 'admin123'
  u.user_tokens {|n| n.user_tokens << Factory(:user_token) }
end

Factory.define :author, parent: :user do |a|
  # It's just an alias 
end
