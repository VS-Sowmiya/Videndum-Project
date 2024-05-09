Feature: Testing Robot Head Utility

  Scenario: Moving Robot to Target Location
    Given the user selects a target location
    When the user presses the "GO" button for Robot #1
    Then Robot #1 should start moving to the selected target location
    And the UI should display the status of Robot #1 as "Moving"

  Scenario: Moving All Robots to Target Locations
    Given the user selects a target location
    When the user presses the "Move All" button
    Then all robots should move to the selected target location
    And the UI should display the status of each robot as "Moving"

  Scenario: Stopping Robot Move
    Given Robot #1 is moving to a target location
    When the user presses the "Stop" button for Robot #1
    Then Robot #1 should stop moving
    And the UI should display the status of Robot #1 as "Idle"

  Scenario: Stopping All Robot Moves
    Given all robots are moving to target locations
    When the user presses the "Stop All" button
    Then all robots should stop moving
    And the UI should display the status of each robot as "Idle"

  Scenario: Preventing Concurrent Target Moves
    Given Robot #1 is in the process of moving to a target location
    When the user attempts to trigger the same target move for Robot #1
    Then the UI should not allow the user to initiate the move again

  Scenario: Displaying Time-to-Shot Value
    Given Robot #1 is moving to a target location
    When the robot is in transit to the target location
    Then the UI should display a progress bar indicating the estimated time-to-shot value
    And the UI should remain responsive for the user to select another robot

  Scenario: Error Handling during Robot Movement
    Given Robot #1 encounters an error during movement
    When the error occurs
    Then the error should be shown in the user interface to the user
    And the UI should display the status of Robot #1 as "Error"
