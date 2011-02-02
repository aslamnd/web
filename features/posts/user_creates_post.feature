Feature: User creates a post
  In order to let the world know about my knowledge
  As a user
  I want to create a blog post

  Scenario: User creates a post
    Given I am logged in
    And I am on the admin posts page
    And I follow "Add a new post"
    When I fill in "Title" with "Cucumber is not only for veggies"
    And I fill in "Body" with "Readable cucumber stories help the development and maintaining process."
    And I press "Create Post"
    Then I should see "Post was successfully created."
    And I should see "Cucumber is not only for veggies" in the posts list
