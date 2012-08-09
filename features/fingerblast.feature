Feature: User enjoys a timed fingerboard workout
  Scenario: User views the first workout
    When I start the app
    And I choose the "metolius3d" hangboard
    And I choose the "Beginner" difficulty
    Then I should see "10 second dead hang, deep flat edge (7)" as the current step
    And I should see "60" as the countdown
