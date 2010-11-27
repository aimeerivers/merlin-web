Given /^I have started a new adventure$/ do
  visit adventure_path
end

Then /^I should start a new adventure$/ do
  page.should have_css('.description', :text => 'You wake up on a grassy bank')
end

When /^I move (North|South|East|West)$/ do |direction|
  click_link 'Go ' + direction
end

Then /^the adventure should take me to the trees$/ do
  page.should have_css('.description', :text => 'Thick trees are at the foot of a mountain')
end
