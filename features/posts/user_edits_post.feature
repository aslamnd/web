Feature: User edits a post
  In order to keep my posts up to date
  As a user
  I want to edit an existing blog post

  Scenario: User edits a post
    Given I am logged in
    And a post exists
    And I am on the admin posts page
    When I follow "Edit" in the first post
    And I fill in "Title" with "Cucumber is not only for veggies (updated!)"
    And I fill in "Body" with "Also, here are some new articles arguing why Cucumber might be useful!"
    And I press "Update Post"
    Then I should see "Post was successfully updated."
    And I should see "Cucumber is not only for veggies (updated!)" in the posts list
