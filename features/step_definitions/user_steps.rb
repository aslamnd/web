Given /^"([^"]*?)" exists as author$/ do |name|
  create_model(:user, name: name)
end

When /^I visit "([^"]*?)" profile$/ do |name|
  Given %{I visit the blog subdomain}
  visit blog_user_path find_model(:user, name: name)
end
