Then /^I should see (\d+) posts$/ do |num|
  if Fixnum === num
    page.should have_css('.post', count: num.to_i)
  else
    page.should_not have_css('.post')
  end
end
