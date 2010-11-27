Then /^I should start a new adventure$/ do
  page.should have_css('.description', :text => 'You wake up on a grassy bank')
end
