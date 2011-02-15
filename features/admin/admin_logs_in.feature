Feature: Admin signs in
  In order to use the backend
  As an admin
  I want to sign in with Twitter

  Scenario: Admin signs in with Twitter
    Given I am registered as and admin
    And I am on the login page
    When I follow "Sign in with Twitter"
    Then I should see "Successfully authorized from Twitter account"
    And I should be on the admin dashboard
