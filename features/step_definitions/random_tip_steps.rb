Then /^I should see the tip$/ do
  visit tips_random_path
  page.should have_content @tip.content
end
