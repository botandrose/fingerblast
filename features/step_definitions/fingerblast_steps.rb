When /^I start the app$/ do
  visit "/"
end

When /^I choose the "(.*?)" hangboard$/ do |hangboard_name|
  click_on hangboard_name
end

When /^I choose the "(.*?)" difficulty$/ do |difficulty|
  click_on difficulty
end

When /^I press "(.*?)"$/ do |button|
  click_on button
end

When /^time advances by (\d+) seconds$/ do |seconds|
  page.driver.evaluate_script "window.clock.tick(#{seconds.to_i * 1000});"
end

Then /^I should see "(.*?)" as the current step$/ do |text|
  page.should have_css("section:contains('#{text}')")
end

Then /^I should see "(.*?)" as the countdown$/ do |text|
  page.should have_css("#counter:contains('#{text}')")
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end
