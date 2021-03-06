Feature: User lists posts
  In order to know what posts are published
  As a user
  I want to list existing posts

  Scenario: User lists posts
    Given I am logged in
    And 3 posts exist
    When I am on the admin posts page
    Then I should see 3 posts in the posts list

  Scenario: User lists unpublished posts
    Given I am logged in
    And an unpublished post exist
    When I am on the admin posts page
    Then I should see 1 post in the posts list
