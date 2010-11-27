Then /^I should be able to start a new adventure$/ do
  page.should have_css('ul.choice li', text: 'start a new adventure')
end

