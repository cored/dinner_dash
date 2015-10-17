Feature: Browse items
  In order to see all items
  As an User
  I want to be able to browse items

  Scenario: No items, unauthenticated user
    Given I am an unauthenticated user
    And no items exists
    When I view all the items
    Then I should see the following items:
      | name |

  Scenario: 2 items, unauthenticated user
    Given I am an unauthenticated user
    And the following items exist:
      | name   |
      | item 1 |
      | item 2 |
    When I view all the items
    Then I should see the following items:
      | name   |
      | item 1 |
      | item 2 |

  @ui
  Scenario: No items, unauthenticated user
    Given I am an unauthenticated user
    And no items exists
    When I visit the items page
    Then I should see the following message in the page "There are no items created"

  @ui
  Scenario: 2 items, unauthenticated user
    Given I am an unauthenticated user
    And the following items exist:
      | name   |
      | item 1 |
      | item 2 |
    When I visit the items page
    Then I should see the following items in the page:
      | name   |
      | item 1 |
      | item 2 |
