When /^I start the app$/ do
  visit "/"
end

When /^I choose the "(.*?)" hangboard$/ do |hangboard_name|
  click_on hangboard_name
end

When /^I choose the "(.*?)" difficulty$/ do |difficulty|
  click_on difficulty
end

Then /^I should see "(.*?)" as the current step$/ do |text|
  page.should have_css("section:text('#{text}')")
end

Then /^I should see "(.*?)" as the countdown$/ do |text|
  page.should have_css("#counter:text('#{text}')")
end
