Feature: Show paper details
  In order to view the details of a paper
  As a user
  I want to follow the link of a paper
  Then I should see the paper's name, author, publication and publication date
  And I can follow links to show the details of its authors

  Scenario: Show a paper's details
    Given there is the example author
    And there is the example paper
    And I am on the papers page
    When I follow "Computing Machinery and Intelligence"
    Then I should see the example author
    And I should see the example paper's details

  Scenario: Follow the link to an author in a paper's details
    Given there is the example author
    And there is the example paper
    And I am on the papers page
    When I follow "Computing Machinery and Intelligence"
    And I follow "Alan Turing"
    Then I should see the example author's details
