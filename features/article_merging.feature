Feature: Article Merging
  As a blog administrator
  In order to merge articles
  I want to merge two articles in my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
    Given the following users exist:
    |login	|password 	|email 					|profile_id 	|name	|state |
    |admin	|somepassword	|admin@admin.com			|1			|adam	|active|
    |normaluser |somepassword	|normaluser@normaluser.com 	|2			|norm	|active|	
    
    Given the following articles exist:
    |id	|title    |author		|body	    	|allow_comments	|published_at       |
    |1	|Hard Sums|admin		|some contents	|true          	|2012-11-24 12:12:12|
    |2	|Spellings|normaluser	|ABCs		|true			|2012-11-23 11:11:11|

  Scenario: Unable to merge articles when not admin
  	Given I am not an admin
  	When I am on the edit article page
  	Then I should not see the "merge articles" form
  	
  Scenario: Merged article should contain text of both
  	Given I am logged in as admin
  	Then I should see "Hard Sums"
  	When I follow "Hard Sums"
  	When I fill in "article_id_merge" with "2"
  	And I press "Merge"
  	Then I should see "some contents"
  	And I should see "ABCs"
  	
  Scenario: Merged article should have one author
  	Given I am logged in as admin
  	Given I am on th edit article page
  	Then I should see "admin"
  	And I should not see "normaluser"
  	
  Scenario: Merged article should have one title
  	Given I am logged in as admin
  	When I follow "Hard Sums"
  	Then I should see "Hard Sums"
  	
  
  
 
