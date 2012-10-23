Feature: Show author details
  In order to view an author's details
  As a user
  I want to open up the authors index page
  And follow the link of an author
  Then I should see the author's name and papers
  And I can follow a link to show the details of a paper

  Scenario: Show an author's details
    Given there is the example author
    And there is the example paper
    When I follow "Show authors"
    Then I should be on the authors page
    When I follow "Alan Turing"
    Then I should see the example author's details
    And I should see the example paper

  Scenario: Follow the link to a paper in an author's details
    Given there is the example author
    And there is the example paper
    And I am on the authors page
    When I follow "Alan Turing"
    And I follow "Computing Machinery and Intelligence"
    Then I should see the example paper's details
