Then /^I should see (\d+) posts$/ do |num|
  if num.to_i > 0
    page.should have_css('.post', count: num.to_i)
  else
    page.should_not have_css('.post')
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
