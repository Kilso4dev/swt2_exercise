Feature: Index papers
  In order to view all papers
  As a user
  I want to be on the paper index page as soon as I start up the app
  And there should be a list of all papers

  Scenario: Index papers
    Given there are the example authors
    And there are the example papers
    And I am on the papers page
    Then I should see the example papers
  