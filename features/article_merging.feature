Feature: Article Merging
  As a blog administrator
  In order to merge articles
  I want to merge two articles in my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
    Given the following users exist:
    |login	 |password 	|email 					|profile_id 	|name	|state |
    |admin	 |aaaaaaaa	|joe@snow.com				|1			|admin	|active|
    |normaluser |aaaaaaaa	|normaluser@normaluser.com 	|2			|norm	|active|	
    
    Given the following articles exist:
    |id	|title    |author		|body	    	|allow_comments	|published_at       |
    |1	|Hard Sums|admin		|some contents	|true          	|2012-11-24 12:12:12|
    |2	|Spellings|normaluser	|ABCs		|true			|2012-11-23 11:11:11|

  #Scenario: A non-admin cannot merge articles
  	# possible new feature as it is for a non admin
  #	Given I am not an admin
  #	When I am on the edit article page
  #	Then I should not see the "merge articles" form
  	
  Scenario: When articles are merged, the merged article should contain the text of both previous articles.
  	Given I am logged in as admin
  	Then I should see "Hard Sums"
  	When I follow "Hard Sums"
  	When I fill in "article_id_merge" with "2"
  	And I press "Merge"
  	Then I should see "Article Content 1"
  	And I should see "Article Content 2"
  	
  Scenario: When articles are merged, the merged article should have one author (either one of the authors).
  	Given I am logged in as admin
  	Given I am on the edit article page
  	Then I should see "admin"
  	And I should not see "normaluser"
  	
  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article.
  	Given I am logged in as admin
  	Then I should see "Hard Sums"
  	When I follow "Hard Sums"
  	Then I should see "comment 1"
  	And I should see "comment "
  	
  Scenario: The title of the new article should be the title from either one of the merged articles.
  	Given I am logged in as admin
  	When I follow "Hard Sums"
  	Then I should see "Hard Sums"
  	Then I should see "title 1"
  	And I should see "title 2"
  	
  Scenario: The form field containing the ID of the article to merge with must have the HTML attribute name set to merge_with. 
  	Given I am logged in as admin
  	Given I am on the edit article page
  	Then I should see "merge_with"
  
  
 
