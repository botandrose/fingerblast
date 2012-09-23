When /^I start the app$/ do
  visit "/"
  sync
end

When /^I choose the "(.*?)" hangboard$/ do |hangboard_name|
  click_on hangboard_name
  sync
end

When /^I choose the "(.*?)" difficulty$/ do |difficulty|
  click_on difficulty
  sync
end

When /^I press the restart button$/ do
  click_on "Fingerblast again"
  sync
end

When /^time advances by (\d+) seconds$/ do |seconds|
  # page.driver.evaluate_script "window.clock.tick(#{seconds.to_i * 1000});"
  seconds.to_i.times do
    page.driver.browser.evaluate """
      Fingerblast.router.get('difficultyController.content').tick()
    """
  end
  sync
end

Then /^the current step should be "(.*?)"$/ do |text|
  find("section").text().should == text
end

Then /^the countdown should be "(.*?)"$/ do |text|
  find("#counter").text().should == text
end

Then /^I should see the success screen$/ do
  page.should have_content("Master Fingerblaster!")
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

def sync
  page.driver.browser.evaluate "Ember.run.end()"
end
