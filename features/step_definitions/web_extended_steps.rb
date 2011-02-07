When /^I select "([^"]*)" from my computer to upload it to "([^"]*)"$/ do |filename, name|
  When %(I attach the file "spec/support/files/#{filename}" to "#{name}")
end

Then /^the "([^"]*)" should be highlighted with an error$/ do |field|
  within('div.field_with_errors') do
    find_field(field)
  end
end

When /^I choose "([^"]*)" from "([^"]*)"$/ do |field, label|
  choose(field)
end

Then /^(?:|I )should no longer see "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
  unless selector
    Then %(I should not see "#{text}")
  else
    Then %(I should not see "#{text}" within "#{selector}")
  end
end

When /^(?:|I )select the following(?: within "([^"]*)")?:$/ do |selector, fields|
  with_scope(selector) do
    fields.rows_hash.each do |name, value|
      When %{I select "#{value}" from "#{name}"}
    end
  end
end

Then /^I should get a "([^"]*)" response status$/ do |status|
  page.driver.status_code.should == status.to_i
end

Given /^I select "([^"]*)"( at "([^"]*)")? as (.+)$/ do |date, datetime, time, field|
  month, day, year = date.gsub(',', '').split(' ')
  hour, minutes = time.split(':') if datetime
  field.gsub!(' ', '_')

  [year, month, day, hour || nil, minutes || nil].compact.each_with_index do |value, index|
    When %(I select "#{value}" from "#{field}_#{(index+1)}i")
  end
end


def find_selector(number)
  case number
    when "first" then "nth-of-type(1)"
    when "second" then "nth-of-type(2)"
    when "third" then "nth-of-type(3)"
  end
end
