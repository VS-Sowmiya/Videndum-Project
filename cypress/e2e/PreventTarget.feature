Feature: Preventing Concurrent Target Moves

  Scenario: Preventing Concurrent Target Moves
    Given a robot is in the process of moving to a target location
    When the user attempts to trigger the same target move for the same robot
    Then the UI should not allow the user to initiate the move again

  Scenario: Verify UI Allows Different Target Moves
    Given Robot #2 is moving to Target 2
    When the user attempts to trigger a move for Robot #2 to a different target
    Then the UI should allow the user to initiate the move

  Scenario: Verify UI Allows Concurrent Moves for Different Robots
    Given Robot #5 is moving to Target 5
    And Robot #6 is moving to Target 6
    When the user attempts to trigger a move for Robot #5 to Target 6
    Then the UI should allow the user to initiate the move
