@simple_map
Feature: Moving around
  In order to explore the world
  As a user
  I want to be able to move North, South, East and West

  Scenario: User moves North from the start page
    Given I have started a new adventure
    When I move North
    Then the adventure should take me to the trees
    When I move South
    Then the adventure should take me back to the grassy bank

  Scenario: User moves East from the start page
    Given I have started a new adventure
    When I move East
    Then the adventure should take me to the evergreen glade
    When I move West
    Then the adventure should take me back to the grassy bank

  Scenario: User moves South from the start page
    Given I have started a new adventure
    When I move South
    Then the adventure should take me to the deep river
    When I move North
    Then the adventure should take me back to the grassy bank

  Scenario: A message is shown if you can't move that way
    Given I have started a new adventure
    When I move South
    And I try to move East
    Then I should not be able to go that way

  Scenario: Player can get stuck in a dead end room
    Given I have started a new adventure
    When I move East
    And I try to move East
    Then I should be lost
