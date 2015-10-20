Feature: Browse items by category
  In order to see items grouped by category
  As a User
  I want to be able to list items grouped by category

  Scenario: 2 items belongs to a category
    Given I am an unauthenticated user
    And the following categories exist:
      | name       |
      | category 1 |
      | category 2 |
    And the following items exist:
      | name   | category   |
      | item 1 | category 1 |
      | item 2 | category 1 |
      | item 3 | category 2 |
    When I view items grouped by category "category 1"
    Then I should see the following items:
      | name   |
      | item 1 |
      | item 2 |
