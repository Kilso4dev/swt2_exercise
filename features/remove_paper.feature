Feature: Remove paper
  In order to remove a paper
  As a user
  I want to open up the papers index page
  And there should be a delete link for each listed paper
  When I follow that link
  Then the paper should be removed

  Scenario: Remove a paper
    Given there are the example authors
    And there are the example papers
    And I am on the papers page
    When I follow "Delete" within "//tr[descendant-or-self::a='Computing Machinery and Intelligence']"
    Then I should be on the papers page
    And I should see "A Note on the Entscheidungsproblem"
    But I should not see "Computing Machinery and Intelligence"

  Scenario: Removing a paper does not remove its authors
    Given there are the example authors
    And there are the example papers
    And I am on the papers page
    When I follow "Delete" within "//tr[descendant-or-self::a='Computing Machinery and Intelligence']"
    And I go to the authors page
    Then I should see the example authors

  Scenario: Removing a paper removes it from its authors' papers
    Given there are the example authors
    And there are the example papers
    And I am on the papers page
    When I follow "Delete" within "//tr[descendant-or-self::a='Computing Machinery and Intelligence']"
    And I go to the authors page
    And I follow "Alan Turing"
    Then I should not see "Computing Machinery and Intelligence"
  