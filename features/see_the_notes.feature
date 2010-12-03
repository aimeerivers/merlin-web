Feature: See the notes
  As a player
  I want to see the notes
  So that I can find out how to play the game

  Scenario: Player sees the notes
    When I go to the choice page
    And I follow "See the notes"
    Then I should see the notes page
