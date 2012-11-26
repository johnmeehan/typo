#part1.2
#Create cucumber stories based on mockup that we will provide for a new Typo feature: article merging. These stories will serve as high-level integration/acceptance tests.
Given /^the following users exist:$/ do |users_table|
  # table is a Cucumber::Ast::Table
  users_table.hashes.each do |user|
  	User.create(user)
  end
  #puts User.all
end

Given /^the following articles exist:$/ do |articles_table|
  # table is a Cucumber::Ast::Table
 articles_table.hashes.each do |article|
 	Article.create(article)
 end
 #puts Article.all
  
end

Given /^I am not an admin$/ do
  	visit '/accounts/login'
  	fill_in 'user_login', :with => 'normaluser'
  	fill_in 'user_password', :with => 'aaaaaaaa'
  	click_button 'login'
end

Then /^I should not see the "(.*?)" form$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I am logged in as admin$/ do
    	visit '/accounts/login'
  	fill_in 'user_login', :with => 'admin'
  	fill_in 'user_password', :with => 'aaaaaaaa'
  	click_button 'login'
end

