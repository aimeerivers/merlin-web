Then /^my score should be (\d+)$/ do |score|
  page.should have_css('.score', :text => "Score: #{score}")
end
