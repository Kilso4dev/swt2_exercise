Feature: Add author
  In order to add an author
  As a user
  I want to enter the details into a form and confirm
  When I have made mistakes while entering the author's details
  Then I want to be told that errors have occurred
  And the author should not be saved
  
  Scenario: Add an author with an invalid name
    Given I am on the authors page
    When I follow "Add author"
    And I fill in the following:
      | First name | |
      | Last name | |
      | Homepage | http://www.google.com |
    And I press "Save"
    Then I should see "error"

  Scenario: Add an author with an invalid homepage
    Given I am on the authors page
    When I follow "Add author"
    And I fill in the following:
      | First name | Alan |
      | Last name | Turing |
      | Homepage | i_am_not_a_url |
    And I press "Save"
    Then I should see "error"