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

  Scenario: Score is shown at the end of the game
    Given I have started a new adventure
    When I move South
    And I take the "mirror"
    And I move North
    And I drop the "mirror"
    When I quit the adventure
    And I confirm that I am sure about quitting the adventure
    Then the adventure should be over
    And I should see a final score of 3
    And I should see a best possible score of 24

  Scenario: Player posts final score to the hall of fame
    Given I have started a new adventure
    And I move South
    And I take the "mirror"
    And I move North
    And I drop the "mirror"
    When I quit the adventure
    And I confirm that I am sure about quitting the adventure
    Then I should be offered to post my score to the hall of fame
    When I fill in "Your Name (or nickname)" with "aimee"
    And I press "Add my score to the hall of fame"
    Then I should see "aimee" in the hall of fame with 3 points
