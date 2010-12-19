Then /^my score should be (\d+)$/ do |score|
  page.should have_css('.score', text: "Score: #{score}")
end

Then /^I should see a final score of (\d+)$/ do |score|
  page.should have_css('.your-score', text: "Your score: #{score}")
end

Then /^I should see a best possible score of (\d+)$/ do |score|
  page.should have_css('.best-possible-score', text: "Best possible score: #{score}")
end

Then /^I should be offered to post my score to the hall of fame$/ do
  page.should have_content("Add your score to the hall of fame?")
end

Then /^I should see "([^"]*)" in the hall of fame with (\d+) points$/ do |name, score|
  within(:css, 'table.top-scores tr') do
    page.should have_css('td', text: name)
    page.should have_css('td', text: score)
  end
end
