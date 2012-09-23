Fingerblast.Difficulty = Ember.Object.extend().reopenClass(
  all: ->
    [
      Fingerblast.Difficulty.create id: "beginner", title: "Beginner", steps: [
        "10 second dead hang, deep flat edge (7)"
        "15 second dead hang + one pull-up, outer jugs (1)"
        "2 offset pull-up (1 each arm) center jug (14) & deep three finger pockets (4)"
        "15 second dead hang, extra deep 3 finger pockets (9)"
        "12 second dead hang flat slopers (2) & 5 knee raises outer jugs (1)"
        "16 second offset hang / (8 sec per side), deep pocket (15) & shallow edge (5)"
        "3 pull-ups outer jugs (1)"
        "8 second bent arm hang (elbows @ 90), round slopers (3)"
        "1 pull-up & then 10 second hang, ext-deep 3 finger pocket (9)"
        "dead hang to failure, any holds"
      ]
      Fingerblast.Difficulty.create id: "intermediate", title: "Intermediate"
      Fingerblast.Difficulty.create id: "advanced", title: "Advanced"
    ]

  find: (id) ->
    @all().find (difficulty) -> difficulty.id == id

).reopen

  currentStepHtml: ( ->
    @steps[0]
  ).property("steps")
