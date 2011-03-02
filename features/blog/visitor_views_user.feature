Feature: Visitor views a particular user
  In order to know more about a particular user
  As a visitor
  I want to view a particular user profile

  Scenario: Visitor views user profile
    Given "Charles Dickens" exists as author
    When I visit "Charles Dickens" profile
    Then I should see his Twitter link
    And I should see his Github link
    And I should see his description

  Scenario: Visitor views last 5 user posts
    Given "Charles Dickens" exists as author
    And the user has written the following posts:
      | title                      |
      | I copied Oliver Twist      |
      | Poe was way better         |
      | Growing a beard            |
      | My signature is unreadable |
      | Too many children          |
      | Stop writing posts please  |
    When I visit "Charles Dickens" profile
    Then I should see the following within latest posts list
      | title                      |
      | I copied Oliver Twist      |
      | Poe was way better         |
      | Growing a beard            |
      | My signature is unreadable |
      | Too many children          |

  Scenario: Visitor visits user profile within a post
    Given "Charles Dickens" exists as author
    And the user has written the following posts:
      | title                      |
      | I copied Oliver Twist      |
    And I visit the blog subdomain
    And I follow "I copied Oliver Twist"
    When I follow "Charles Dickens"
    Then I should be on the user's page

  Scenario: Visitor gets a not found error when visiting an unexisting user profile
    When I visit an unexisting user profile
    Then I should get a 404 error

  Scenario: Visitor views user profile
    Given "Charles Dickens" exists as author
    When I visit "Charles Dickens" profile
    Then I should not see "Latest posts" in the user information

  Scenario: Visitor views user profile
    Given "Charles Dickens" exists as author
    And the user has an unpublished post titled "Oh hai!!"
    When I visit "Charles Dickens" profile
    Then I should not see "Oh hai!!" in the user information
