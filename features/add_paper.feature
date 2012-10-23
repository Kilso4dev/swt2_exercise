Feature: Add paper
  In order to add a paper
  As a user
  I want to enter the details into a form and confirm
  Then the paper should be in the database
  And any authors that don't exist yet should be created automatically
  And I should be taken back to the papers index page

  Scenario: Add a simple paper
    Given there is the example author
    And I am on the papers page
    When I follow "Add paper"
    And I fill in the example paper
    And I press "Save"
    Then I should be on the papers page
    And there should be the example paper

  Scenario: Add a paper with an invalid name
    Given I am on the papers page
    When I follow "Add paper"
    And I fill in the following:
      | Title | |
      | Venue | Example publication |
      | Year | 1950 |
    And I press "Save"
    Then I should see "error"

  Scenario: Add a paper with an invalid year
    Given I am on the papers page
    When I follow "Add paper"
    And I fill in the following:
      | Title | Towards more beer in software engineering exercises |
      | Venue | HICSS 2011 |
      | Year | Dies ist keine Jahr |
    And I press "Save"
    Then I should see "error"
    
  Scenario: Add a paper with duplicate authors
    Given there are the example authors
    Given I am on the papers page
    When I follow "Add paper"
    And I fill in the following:
      | Title | The most awesome paper ever written |
      | Venue | Example publication |
      | Year | 1950 |
    And I select "Alan Turing" from "Author 1"
    And I select "Alan Turing" from "Author 2"
    And I press "Save"
    Then I should see "error"
    
  Scenario: Add a paper with empty author
    Given there are the example authors
    Given I am on the papers page
    When I follow "Add paper"
    And I fill in the following:
      | Title | The most awesome paper ever written |
      | Venue | Example publication |
      | Year | 1950 |
    And I select "Alan Turing" from "Author 1"
    And I select "" from "Author 5"
    And I press "Save"
    Then I should be on the papers page