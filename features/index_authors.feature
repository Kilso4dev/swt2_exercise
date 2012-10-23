Feature: Index authors
  In order to view all authors
  As a user
  I want to open up the author index page
  And there should be a list of all authors

  Scenario: Index authors
    Given there are the example authors
    And I am on the homepage
    When I follow "Show authors"
    Then I should be on the authors page
    And I should see the example authors
    