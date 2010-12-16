@simple_map
Feature: Finishing the game
  In order to let people know that they have completed the game
  As a developer
  I want to provide a feedback message when they finish

  Scenario: Player drops all items at the grassy bank
    Given I have started a new adventure
    When I move South
    And I take the "mirror"
    And I take the "rope"
    And I take the "harp"
    And I move North
    And I drop the "mirror"
    And I drop the "rope"
    And I drop the "harp"
    And I move South
    And I take the "penny"
    And I take the "mask"
    And I take the "water"
    And I move North
    And I drop the "penny"
    And I drop the "mask"
    And I drop the "water"
    And I move West
    And I take the "ladder"
    And I move East
    And I drop the "ladder"
    And I move North
    And I take the "cake"
    And I move South
    And I drop the "cake"
    Then I should see the completed adventure success message
