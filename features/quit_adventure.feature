@simple_map
Feature: Quit adventure
  As a player who is stuck
  I want to quit an adventure
  So that I can start a new one

  Scenario: Player quits adventure
    Given I have started a new adventure
    When I quit the adventure
    Then I should see the quit adventure confirmation page
    When I confirm that I am sure about quitting the adventure
    Then the adventure should be over

  Scenario: Player doesn't quit after all and the game continues
    Given I have started a new adventure
    When I move North
    Then the adventure should take me to the trees
    When I quit the adventure
    But I change my mind about quitting
    Then the adventure should take me to the trees
