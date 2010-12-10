@simple_map
Feature: Scoring
  In order to encourage people to play the game
  As a developer
  I want to enable items to have scores which increase your score when dropped at the grassy bank

  Scenario: Player drops items at the grassy bank, and takes them again
    Given I have started a new adventure
    Then my score should be 0
    When I move South
    And I take the "mirror"
    And I move North
    And I drop the "mirror"
    Then my score should be 3

    When I move South
    And I take the "harp"
    And I move North
    And I drop the "harp"
    Then my score should be 6

    When I take the "mirror"
    Then my score should be 3
