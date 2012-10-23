Feature: Add author
  In order to add an author
  As a user
  I want to enter the details into a form and confirm
  Then the author should be in the database
  And I should be taken back to the authors index page

  Scenario: Add a simple author
    Given I am on the authors page
    When I follow "Add author"
    And I fill in the example author
    And I press "Save"
    Then I should be on the authors page
    And there should be the example author
