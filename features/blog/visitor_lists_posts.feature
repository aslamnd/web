Feature: Visitor lists posts
  In order to know more about Codegram
  As a visitor
  I want to list their blog posts

  Scenario: Visitor lists posts
    Given 3 posts exist
    When I visit the blog subdomain
    Then I should see 3 posts in the posts list

  Scenario: Visitor doesn't list unpublished posts
    Given an unpublished post exist
    When I visit the blog subdomain
    Then I should see "Sorry, there are no posts to show"
