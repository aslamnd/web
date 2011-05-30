Given /^a project called "([^"]*)" exists$/ do |name|
  create_model(:project, title: name)
end

Then /^I should see (\d+) projects?$/ do |num|
  if num.to_i > 0
    page.should have_css('.project', count: num.to_i)
  else
    page.should_not have_css('.project')
  end
end
