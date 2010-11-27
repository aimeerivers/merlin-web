Feature: Moving around
  In order to explore the world
  As a user
  I want to be able to move North, South, East and West

  Scenario: User moves North from the start page
    Given I have started a new adventure
    When I move North
    Then the adventure should take me to the trees
