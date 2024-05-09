Feature: Moving Robots to Target Locations
  Scenario: Moving Robot #1 to Target Location "Target 1"
    Given the user has selected a target location "Target 1" for Robot #1
    When the user presses the "GO" button associated with Robot #1
    Then Robot #1 should move to the selected target location "Target 1"
    And the UI should display the status of Robot #1 as "Moving"

Scenario: Moving Robot #2 to Target Location "Target 2" when Robot #2 is Idle
    Given Robot #2 is currently idle
    And the user has selected a target location "Target 2" for Robot #2
    When the user presses the "GO" button associated with Robot #2
    Then Robot #2 should move to the selected target location "Target 2"
    And the UI should display the status of Robot #2 as "Moving"

 Scenario: Attempting to Move Robot #3 to Target Location "Target 3" when Robot #3 is Already Moving
    Given Robot #3 is currently moving
    And the user has selected a target location "Target 3" for Robot #3
    When the user attempts to press the "GO" button associated with Robot #3
    Then the UI should not allow the user to initiate the move again for Robot #3
    And the status of Robot #3 should remain as "Moving"

  Scenario: Attempting to Move Robot #4 to Target Location "Target 4" when Robot #4 Encounters an Error
    Given Robot #4 encounters an error during movement
    And the user has selected a target location "Target 4" for Robot #4
    When the user presses the "GO" button associated with Robot #4
    Then the UI should display the error message
    And the status of Robot #4 should be updated to "Error"

    Feature: Moving All Robots to Target Locations
  Scenario: Moving All Robots to Target Location
    Given the user has selected a target location "Target 1" for all robots
    When the user presses the "Move All" button
    Then all robots should move to the selected target location "Target 1"
    And the UI should display the status of each robot as "Moving"

  Scenario: Attempting to Move All Robots when Some Robots are Idle
    Given Robot #1 and Robot #2 are currently idle
    And Robot #3, Robot #4, Robot #5, and Robot #6 are already moving to a target location
    And the user has selected a target location "Target 2" for all robots
    When the user presses the "Move All" button
    Then only Robot #1 and Robot #2 should move to the selected target location "Target 2"
    And the UI should display the status of Robot #1 and Robot #2 as "Moving"
    And the UI should display the status of Robot #3, Robot #4, Robot #5, and Robot #6 as "Moving"

  Scenario: Attempting to Move All Robots when All Robots are Already Moving
    Given all robots are currently moving to a target location
    And the user has selected a target location "Target 3" for all robots
    When the user presses the "Move All" button
    Then the UI should not initiate any additional movements for the robots
    And the status of all robots should remain as "Moving"

  Scenario: Attempting to Move All Robots to a Bad Target Location
    Given the user has selected a bad target location "Bad Target" for all robots
    When the user presses the "Move All" button
    Then all robots should attempt to move to the bad target location "Bad Target"
    And the UI should display the status of each robot as "Moving"
    And the UI should display an error message indicating the bad target location

  Scenario: Stopping All Robot Movements during Move All
    Given all robots are currently moving to a target location
    When the user presses the "Stop All" button
    Then all robot movements should be halted
    And the UI should display the status of all robots as "Idle"

