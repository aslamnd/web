Feature: Visitor views a particular post
  In order to know more about a particular topic
  As a visitor
  I want to view a particular blog post about it

  Scenario: Visitor views a particular post
    Given a post exists with title: "Fun with new Rails engines", body: "New Rails engines are fun to work with!"
    And I visit the blog subdomain
    When I follow "Fun with new Rails engines"
    Then I should see "New Rails engines are fun to work with!"

  Scenario: Visitor gets a not found error when not a valid date
    Given a post exists with title: "Fun with new Rails engines", body: "New Rails engines are fun to work with!"
    And I visit the blog subdomain
    When I visit a fake post
    Then I should get a 404 error
