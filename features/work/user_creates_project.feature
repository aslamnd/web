Feature: User creates a project
  In order to let the world know about our work
  As a user
  I want to create a new project

  Scenario: User creates a project
    Given I am logged in
    And I am on the admin projects page
    And I follow "Add a new project"

    When I fill in "Title" with "Jamibia"
    And I fill in "Url" with "http://jamibia.com"
    And I fill in "Description" with "Jamibia is an example of code quality!"
    And I fill in "What we did" with "We did it in 48 hours."

    And I fill in "Quote" with "It just made my life better."
    And I fill in "Client name" with "David Heinemeier Hansson"

    Then show me the page
    And I select "Products" from "Category"

    And I check "Promoted"

    And I press "Create Project"
    Then I should see "Project was successfully created."
    And I should see "Jamibia" in the projects list
