Then /^I should find (a|an) "([^"]*)" there$/ do |article, item_name|
  page.should have_css('ul.items li', text: article + ' ' + item_name)
end

When /^I take the "([^"]*)"$/ do |item_name|
  within(:css, "ul.items li.#{item_name}") do
    click_link("Take #{item_name}")
  end
end

Then /^my inventory should contain (a|an) "([^"]*)"$/ do |article, item_name|
  page.should have_css('ul.inventory li', text: article + ' ' + item_name)
end
