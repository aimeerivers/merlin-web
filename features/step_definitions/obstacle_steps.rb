Then /^I should see the restriction "([^"]*)"$/ do |restriction|
  page.should have_css('.notice', text: restriction)
end

Then /^I should see the information "([^"]*)"$/ do |result|
  page.should have_css('.notice', text: result)
end

Then /^the adventure should take me over the old wall$/ do
  page.should have_css('.description', text: "An old wall is to the East")
  page.should have_css('.success', text: 'You have climbed over.')
end
