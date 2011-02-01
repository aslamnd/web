Feature: User deletes a post
  In order to keep my posts organized
  As a user
  I want to delete an existing blog post

  Scenario: User deletes a post
    Given I am logged in
    And a post exists
    And I am on the posts page
    When I follow "Remove" in the first post
    Then I should see "Post was successfully deleted."
    And I should see 0 posts in the posts list
