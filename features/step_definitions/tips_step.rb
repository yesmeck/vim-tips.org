Given /^a new tip$/ do
  @tip = Tip.create!(:content => 'vim rocks!', :approved => true)
end
