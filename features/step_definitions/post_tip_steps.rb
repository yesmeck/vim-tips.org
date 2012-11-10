Given /^I submit a new tips$/ do
  visit new_tip_path
  fill_in 'tip_content', :with => 'Vim rocks!'
  fill_in 'tip_name', :with => 'Meck'
  click_button 'Post'
end

Then /^I should see the success message$/ do
  page.should have_content 'Thanks you'
end
