Feature: Update paper details
  In order to update a the details of a paper
  As a user
  I want to follow the edit link of a paper
  And change the paper's details
  Then the new details should be in the database

  Scenario: Change paper date
    Given there is the example author
    And there is the example paper
    And I am on the papers page
    When I follow "Edit"
    And I fill in the following:
      | Year | 2050 |
    And I press "Save"
    Then I should be on the papers page
    When I follow "Computing Machinery and Intelligence"
    Then I should see "2050"
    And I should see "Alan Turing"
