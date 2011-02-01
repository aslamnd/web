Feature: User deletes a post
  In order to keep my posts organized
  As a user
  I want to delete an existing blog post

  Scenario: User deletes a post
    Given I am logged in
    And a post exists
    And I am on the admin posts page
    When I follow "Remove" in the first post
    Then show me the page
    Then I should see "Post was successfully destroyed."
    And I should see no posts in the posts list
