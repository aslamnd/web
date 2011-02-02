Feature: Posts navigation
  In order to manage my posts
  As a user
  I want to navigate through posts pages and forms

  Scenario: User goes to manage posts
    Given I am logged in
    And I am on the admin page
    When I follow "Posts"
    Then I should be on the admin posts page
