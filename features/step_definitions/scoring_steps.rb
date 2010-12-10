Then /^my score should be (\d+)$/ do |score|
  page.should have_css('.score', text: "Score: #{score}")
end

Then /^I should see a final score of (\d+)$/ do |score|
  page.should have_css('.your-score', text: "Your score: #{score}")
end

Then /^I should see a best possible score of (\d+)$/ do |score|
  page.should have_css('.best-possible-score', text: "Best possible score: #{score}")
end
