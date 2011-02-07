Feature: User edits a project
  In order to keep my projects up to date
  As a user
  I want to edit an existing project

  Scenario: User edits a project
    Given I am logged in
    And a project exists
    And I am on the admin projects page
    When I follow "Edit" in the first project

    And I fill in "Title" with "Rubygems"
    And I fill in "Url" with "http://rubygems.org"

    And I select "Open Source" from "Category"

    And I press "Update Project"
    Then I should see "Project was successfully updated."
    And I should see "Rubygems" in the projects list

  Scenario: User uploads more screenshots from a project
    Given I am logged in
    And a project exists
    And I am on the admin projects page
    When I follow "Edit" in the first project

    And I select "screenshot.png" from my computer to upload it to "Project screenshot"

    And I press "Update Project"
    Then I should see "Project was successfully updated."
    And the project should have 2 screenshots

  Scenario: User deletes a screenshot from a project
    Given I am logged in
    And a project exists
    And I am on the admin projects page
    When I follow "Edit" in the first project

    When I check "Delete" for the first screenshot

    And I press "Update Project"
    Then I should see "Project was successfully updated."
    And the project should have 0 screenshots
