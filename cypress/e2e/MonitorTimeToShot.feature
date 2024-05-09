Feature: Monitoring Time-to-Shot Value and Progress

  Scenario: Monitoring Time-to-Shot Value and Progress
    Given the user has initiated a movement of a robot
    When the robot is in transit to the target location
    Then the UI should display a progress bar indicating the estimated time-to-shot value
    And the UI should remain responsive for the user to select another robot

  Scenario: Verify Progress Bar Updates Correctly
    Given the user has initiated movement of a robot
    When the robot is in transit to the target location
    Then the progress bar should update continuously based on the estimated time-to-shot value

  Scenario: Verify UI Responsiveness
    Given the user has initiated movement of a robot
    When the robot is in transit to the target location
    Then the UI should remain responsive, allowing the user to interact with other elements while the robot is moving

  Scenario Outline: Verify Time-to-Shot Displayed Correctly
    Given the user has initiated movement of a <robot>
    When the robot is in transit to the target location
    Then the UI should display the time-to-shot value <timeToShot> for <robot>

    Examples:
      | robot    | timeToShot  |
      | Robot #1 | 0:05:00     |
      | Robot #2 | 0:03:30     |
      | Robot #3 | 0:06:15     |
      | Robot #4 | 0:04:45     |
