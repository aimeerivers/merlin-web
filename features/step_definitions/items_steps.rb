Then /^I should find (a|an) "([^"]*)" there$/ do |article, item_name|
  page.should have_css('p.items a', text: article + ' ' + item_name)
end

When /^I take the "([^"]*)"$/ do |item_name|
  within(:css, 'p.items') { click_link(item_name) }
end

When /^I try to take the "([^"]*)"$/ do |item_name|
  visit take_item_path(item_name)
end

When /^I drop the "([^"]*)"$/ do |item_name|
  within(:css, "ul.inventory li.#{item_name}") do
    click_link('drop')
  end
end

Then /^my inventory (should|should not) contain (a|an) "([^"]*)"$/ do |should_or_not, article, item_name|
  page.send(should_or_not.sub(' ', '_'), have_css('ul.inventory li', text: item_name))
end

When /^I use the "([^"]*)"$/ do |item_name|
  within(:css, "ul.inventory li.#{item_name}") do
    click_link('use')
  end
end

When /^I try to use the "([^"]*)"$/ do |item_name|
  visit use_item_path(item_name)
end

Then /^I should be carrying too much$/ do
  page.should have_css('.error', text: "You're carrying too much.")
end
