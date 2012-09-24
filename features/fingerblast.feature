Feature: User enjoys a timed fingerboard workout
  Scenario: User enjoys the metolius 3d beginner x1 workout
    When I start the app
    And I choose the "Metolius 3D" hangboard
    And I choose the "Beginner x1.0" difficulty
    Then the current step should be "10 second dead hang, deep flat edge (7)"
    And the countdown should be "60"

    When time advances by 10 seconds
    Then the countdown should be "50"

    When time advances by 50 seconds
    Then the current step should be "15 second dead hang + 1 pull-up, outer jugs (1)"
    And the countdown should be "60"

    When time advances by 540 seconds
    Then I should see the success screen

    When I press the restart button
    Then I should see "Fingerblast!"

  Scenario: User enjoys the metolius 3d beginner x1.5 workout
    When I start the app
    And I choose the "Metolius 3D" hangboard
    And I choose the "Beginner x1.5" difficulty
    Then the current step should be "15 second dead hang, deep flat edge (7)"
    And the countdown should be "60"

    When time advances by 10 seconds
    Then the countdown should be "50"

    When time advances by 50 seconds
    Then the current step should be "23 second dead hang + 2 pull-up, outer jugs (1)"
    And the countdown should be "60"

    When time advances by 540 seconds
    Then I should see the success screen

    When I press the restart button
    Then I should see "Fingerblast!"

  Scenario: User enjoys the pure force advanced workout
    When I start the app
    And I choose the "Pure Force" hangboard
    And I choose the "Advanced x1.0" difficulty
    Then the current step should be "6 pulls Rounded Sloper"
    And the countdown should be "60"

    When time advances by 10 seconds
    Then the countdown should be "50"

    When time advances by 50 seconds
    Then the current step should be "20 second hang Medium Edge, 3 Pulls Jugs"

    And the countdown should be "60"

    When time advances by 540 seconds
    Then I should see the success screen

    When I press the restart button
    Then I should see "Fingerblast!"
