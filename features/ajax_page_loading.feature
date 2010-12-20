@selenium @simple_map
Feature: AJAX page loading
  In order to allow for faster page responses
  As a developer
  I want to enable AJAX page loading

  Scenario: Items and obstacles
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

  Scenario: Ending the game
    Given I have started a new adventure
    When I move South
    Then the adventure should take me to the deep river
    When I try to move South
    Then I should see the restriction "You are swept away by the current"
    And the adventure should be over
