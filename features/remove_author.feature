Feature: Remove authors
  In order to remove an author
  As a user
  I want to open up the author index page
  And there should be a delete link for each listed author
  When I follow that link
  Then the author should be removed
  And the author's name should not appear in any paper anymore

  Scenario: Remove an author
    Given there are the example authors
    And there are the example papers
    And I am on the authors page
    When I follow "Delete" within "//tr[descendant-or-self::a='Alonzo Church']"
    Then I should be on the authors page
    And I should see the example author
    But I should not see "Alonzo Church"

  Scenario: Removing an author does not remove their papers
    Given there are the example authors
    And there are the example papers
    And I am on the authors page
    When I follow "Delete" within "//tr[descendant-or-self::a='Alonzo Church']"
    And I go to the papers page
    Then I should see the example papers

  Scenario: Removing an author removes them from their papers' authors
    Given there are the example authors
    And there are the example papers
    And I am on the authors page
    When I follow "Delete" within "//tr[descendant-or-self::a='Alan Turing']"
    And I go to the papers page
    And I follow "Computing Machinery and Intelligence"
    Then I should not see "Alan Turing"
