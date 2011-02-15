Feature: Projects navigation
  In order to list my projects
  As a user or a visitor
  I want to navigate through projects

  Scenario: User goes to manage projects
    Given I am logged in
    And I am on the admin page
    When I follow "Projects"
    Then I should be on the admin projects page

  Scenario: User views the current project when editing
    Given I am logged in
    And a project exists
    And I am on the project edit page
    When I follow "View project"
    Then I should be on the project page

  Scenario: Visitor goes to visit projects
    Given I am logged in
    And I am on the home page
    When I follow "Work"
    Then I should be on the work page
