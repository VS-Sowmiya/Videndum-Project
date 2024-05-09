Feature: Handling Error During Movement

  Scenario Outline: Error message displayed when error occurs during robot movement
    Given Robot #<robot_number> is in the process of moving to a target location
    When an error occurs on Robot #<robot_number>
    Then the UI should display the error message to the user
    And the robot movement should be stopped
    And the UI should display the status of Robot #<robot_number> as "Error"

    Examples:
      | robot_number |
      | 1            |
      | 2            |
      | 3            |
      | 4            |

  Scenario Outline: Error occurs when no robot is moving
    Given all robots are in "Idle" state
    When an error occurs on any robot
    Then no action should be taken
    And the UI status of all robots should remain as "Idle"