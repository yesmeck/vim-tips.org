Then /^I should see the tip on homepage$/ do
  visit root_path
  page.should have_content @tip.content
end
