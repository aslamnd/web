Then /^I should see (\d+) posts?$/ do |num|
  if num.to_i > 0
    page.should have_selector('.post', count: num.to_i)
  else
    page.should_not have_selector('.post')
  end
end

When /^I visit a fake post$/ do
  visit '/tags/fake'
end

Then /^I should get a (\d+) error$/ do |arg1|
  page.status_code == 404
end

Given /^an unpublished post exist$/ do
  create_model(:post, published: false)
end

When /^I visit the unpublished post$/ do
  post = Post.unscoped.last
  visit blog_post_path(post.year, post.month, post)
end

Then /^I should see a post$/ do
  page.should have_selector('article.post')
end

When /^I select "([^"]*)" from the projects list$/ do |project_name|
    pending # express the regexp above with the code you wish you had
end

Then /^I should see "([^"]*)" in the project page$/ do |post_title|
    pending # express the regexp above with the code you wish you had
end
