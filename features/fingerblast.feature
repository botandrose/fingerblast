Feature: User enjoys a timed fingerboard workout
  Scenario: User views the first workout
    When I start the app
    And I choose the "metolius3d" hangboard
    And I choose the "Beginner" difficulty
    Then I should see "10 second dead hang, deep flat edge (7)" as the current step
    And I should see "60" as the countdown

    When time advances by 10 seconds
    Then I should see "50" as the countdown

    When time advances by 50 seconds
    Then I should see "15 second dead hang + one pull-up, outer jugs (1)" as the current step
    And I should see "60" as the countdown

    When time advances by 540 seconds
    Then I should see "Master Fingerblaster!"

    When I press "Fingerblast again"
    Then I should see "Fingerblast!"
