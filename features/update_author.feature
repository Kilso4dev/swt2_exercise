Feature: Update author details
  In order to update an author's details
  As a user
  I want to open up the authors index page
  And follow the edit link of an author
  And change the author's details
  Then the new details should be in the database

  Scenario: Change author name
    Given there is an "author" with the following:
      | First name | Alsn |
      | Last name | Toring |
      | Homepage | http://www.google.de |
    When I follow "Show authors"
    Then I should be on the authors page
    When I follow "Edit"
    And I fill in the example author
    And I press "Save"
    Then there should be the example author
    And I should be on the authors page
