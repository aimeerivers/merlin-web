Then /^I should find (a|an) "([^"]*)" there$/ do |article, item_name|
  page.should have_css('ul.items li', text: article + ' ' + item_name)
end

When /^I take the "([^"]*)"$/ do |item_name|
  within(:css, "ul.items li.#{item_name}") do
    click_link("Take #{item_name}")
  end
end

When /^I drop the "([^"]*)"$/ do |item_name|
  within(:css, "ul.inventory li.#{item_name}") do
    click_link("Drop #{item_name}")
  end
end

Then /^my inventory (should|should not) contain (a|an) "([^"]*)"$/ do |should_or_not, article, item_name|
  page.send(should_or_not.sub(' ', '_'), have_css('ul.inventory li', text: article + ' ' + item_name))
end
