Given /^a new tip$/ do
  @movie = Tip.create!(:content => 'vim rocks!', :approved => true)
end

Then /^I should see the tip on homepage$/ do
  visit root_path
  page.should have_content @movie.content
end
