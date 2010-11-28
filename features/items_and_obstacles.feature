@simple_map
Feature: Items and obstacles
  In order to get past obstacles
  As a user
  I want to pick up and use items

  Scenario: User finds a mirror
    Given I have started a new adventure
    When I move South
    Then the adventure should take me to the deep river
    And I should find a "mirror" there
    When I take the "mirror"
    Then my inventory should contain a "mirror"
