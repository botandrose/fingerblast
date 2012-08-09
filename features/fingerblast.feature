Feature: User enjoys a timed fingerboard workout
  Scenario: User views the first workout
    When I start the app
    And I choose the "Metolius 3D" hangboard
    And I choose the "Beginner" difficulty
    Then the current step should be "10 second dead hang, deep flat edge (7)"
    And the countdown should be "60"

    When time advances by 10 seconds
    Then the countdown should be "50"

    When time advances by 50 seconds
    Then the current step should be "15 second dead hang + one pull-up, outer jugs (1)"
    And the countdown should be "60"

    When time advances by 540 seconds
    Then I should see the success screen

    When I press the restart button
    Then I should see "Fingerblast!"
