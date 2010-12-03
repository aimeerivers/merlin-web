Then /^I should be able to start a new adventure$/ do
  page.should have_css('ul.choice li', text: 'Start a new adventure')
end

Then /^I should see the notes page$/ do
  page.should have_css('p', text: 'To move around, use the direction links')
end
