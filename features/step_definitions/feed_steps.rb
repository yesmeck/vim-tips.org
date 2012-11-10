Then /^I should see the tip in feed$/ do
  visit feed_path
  page.should have_content @tip.content
end
