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

  Scenario: User drops an item
    Given I have started a new adventure
    And I move South
    And I take the "mirror"
    When I move North
    And I drop the "mirror"
    Then I should find a "mirror" there
    And my inventory should not contain a "mirror"

  Scenario: An obstacle blocks the user but an item can be used to overcome it
    Given I have started a new adventure
    When I move West
    Then the adventure should take me to the old stone wall
    When I try to move West
    Then I should see the restriction "The wall is too high"
    When I take the "ladder"
    And I use the "ladder"
    Then I should see the information "The ladder leans against the wall"
    When I move West
    Then the adventure should take me over the old wall

  Scenario: An obstacle can be fatal without the item
    Given I have started a new adventure
    When I move South
    Then the adventure should take me to the deep river
    When I try to move South
    Then I should see the restriction "You are swept away by the current"
    And the adventure should be over

  Scenario: Player cannot carry more than 5 items
    Given I have started a new adventure
    When I move South
    And I take the "mirror"
    And I take the "rope"
    And I take the "harp"
    And I take the "mask"
    And I take the "water"
    And I try to take the "penny"
    Then I should be carrying too much
    And my inventory should not contain a "penny"

  Scenario: Attempting to use an item straight away begins a new game
    When I try to use the "ladder"
    Then I should start a new adventure
    And I should see "You haven't got that"
