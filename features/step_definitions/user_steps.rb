Given /^"([^"]*?)" exists as author$/ do |name|
  create_model(:user, name: name, twitter: "charles_dickens", github: "charles_dickens", description: "I AM A CHEATER!")
end

When /^I visit "([^"]*?)" profile$/ do |name|
  Given %{I visit the blog subdomain}
  visit blog_user_path find_model(:user, name: name)
end

Then /^I should see his Twitter link$/ do
  page.should have_content("@charles_dickens")
end

Then /^I should see his Github link$/ do
  page.should have_content("github.com/charles_dickens")
end

Then /^I should see his description$/ do
  page.should have_content("I AM A CHEATER!")
end

Given /^the user has written the following posts:$/ do |posts|
  posts.hashes.each do |post|
    create_model(:post, title: post["title"], author: find_model(:user), published: true)
  end
end

Then /^I should see the following within latest posts list$/ do |posts|
  posts.hashes.each do |post|
    page.should have_content(post["title"])
  end
end

When /^I visit an unexisting user profile$/ do
  Given %{I visit the blog subdomain}
  visit "/users/fake-user"
end

Given /^the user has an unpublished post titled "([^"]*)"$/ do |post_title|
  create_model(:post, title: post_title, author: find_model(:user), published: false)
end

