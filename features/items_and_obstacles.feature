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

  @wip
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