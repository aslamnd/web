Feature: User creates a project
  In order to let the world know about our work
  As a user
  I want to create a new project

  Scenario: User creates a project
    Given I am logged in
    And I am on the admin projects page
    And I follow "Add a new project"

    When I fill in the following:
      | Title         | Jamibia                                |
      | Url           | http://jamibia.com                     |
      | Description   | Jamibia is an example of code quality! |
      | What we did   | We did it in 48 hours.                 |
      | Quote         | It just made my life better.           |
      | Client name   | David Heinemeier Hansson               |

    And I select "Products" from "Category"
    And I check "Promoted"
    And I select "screenshot.png" from my computer to upload it to "Project screenshot"

    And I press "Create Project"

    Then I should see "Project was successfully created."
    And I should see "Jamibia" in the projects list
    And a project should exist
    And the project should have 1 screenshots

  Scenario: User creates an open source project
    Given I am logged in
    And I am on the admin projects page
    And I follow "Add a new project"

    When I fill in the following:
      | Title       | Date validator                                   |
      | Url         | http://github.com/codegram/date_validator        |
      | Description | Date validator is a cool project.                |
      | What we did | It performs better than its node.js counterpart. |

    And I select "Open Source" from "Category"
    And I fill in "Gem name" with "date_validator"
    And I check "Promoted"

    And I press "Create Project"

    Then I should see "Project was successfully created."
    And I should see "Date validator" in the projects list
