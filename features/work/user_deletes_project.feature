Feature: User deletes a project
  In order to keep my projects organized
  As a user
  I want to delete an existing project

  Scenario: User deletes a project
    Given I am logged in
    And a project exists
    And I am on the admin projects page
    When I follow "Remove" in the first project
    Then I should see "Project was successfully destroyed."
    And I should see 0 projects in the projects list
