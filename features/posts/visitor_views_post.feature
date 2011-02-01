Feature: Visitor views a particular post
  In order to know more about a particular topic
  As a visitor
  I want to view a particular blog post about it

  Scenario: Visitor views a particular post
    Given 3 posts exist
    And I visit the blog subdomain
    When I follow "Fun with Rails engines" in the first post
    Then I should see "New Rails engines are fun to work with!"
