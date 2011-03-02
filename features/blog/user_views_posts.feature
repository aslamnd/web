Feature: User views posts
  In order to see the post markup
  As a user
  I want to view my posts

  Scenario: User views post
    Given I am logged in
    And 1 posts exist
    When I am on the admin posts page
    And I follow "Preview" in the first post
    Then I should see a post

  Scenario: User views unpublished posts
    Given I am logged in
    And an unpublished post exist
    When I am on the admin posts page
    And I follow "Preview" in the first post
    Then I should see a post
