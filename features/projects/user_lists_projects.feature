Feature: User lists projects
  In order to know what projects are published
  As a user
  I want to list projects

  Scenario: User lists projects
    Given I am logged in
    And 3 projects exist
    When I am on the admin projects page
    Then I should see 3 projects in the projects list
