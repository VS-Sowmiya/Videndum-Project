Feature: Stopping All Robot Movements

  Scenario: User stops all robot movements
    Given Robot #1 is in the process of moving to a target location
    And Robot #2 is in the process of moving to a target location
    When the user presses the "Stop All" button
    Then all robot movements should be halted
    And the UI should display the status of all robots as "Idle"

  Scenario: User stops all robot movements when no robot is moving
    Given all robots are in "Idle" state
    When the user presses the "Stop All" button
    Then no action should be taken
    And the UI status of all robots should remain as "Idle"

  Scenario: User attempts to stop all robot movements multiple times
    Given Robot #1 is in the process of moving to a target location
    And Robot #2 is in the process of moving to a target location
    When the user presses the "Stop All" button twice
    Then all robot movements should be halted only once
    And the UI should display the status of all robots as "Idle"
