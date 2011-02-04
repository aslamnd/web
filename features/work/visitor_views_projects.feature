Feature: Visitor lists work categories
  In order to know more about Codegram work
  As a visitor
  I want to list their work categories

  Scenario: Visitor lists work categories
    When I go to the work page
    Then I should see "Client work"
    And I should see "Products"
    And I should see "Open Source"

  Scenario: Visitor visits Client Work projects
    Given  I am on to the work page
    And 1 projects exist with category: "client-work"
    When I follow "Client work"
    Then I should see 1 project in the projects list

  Scenario: Visitor visits Products projects
    Given  I am on to the work page
    And 1 projects exist with category: "products"
    When I follow "Products"
    Then I should see 1 project in the projects list

  Scenario: Visitor visits Open Source projects
    Given  I am on to the work page
    And 1 projects exist with category: "open-source"
    When I follow "Open Source"
    Then I should see 1 project in the projects list
