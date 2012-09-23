Fingerblast.Difficulty = Ember.Object.extend
  isPaused: false

  currentStep: null

  currentStepHtml: ( ->
    @get("steps")[@get("currentStep") - 1]
  ).property("steps", "currentStep")

  defaultCountdown: 60

  countdown: null

  startCountdown: ->
    @set("countdown", @defaultCountdown)
    @unpause()
    Fingerblast.Whistle.play()

  pause: ->
    window.clearInterval(window.interval) if window.interval?
    @set("isPaused", true)

  unpause: ->
    window.clearInterval(window.interval) if window.interval?
    window.interval = window.setInterval (=> @tick()), 1000
    @set("isPaused", false)

  # private

  tick: ->
    @decrementProperty("countdown")
    if @get("countdown") == 0
      window.clearInterval window.interval
      if @get("steps").length == @get("currentStep")
        Fingerblast.router.transitionTo("success")
      else
        Fingerblast.router.transitionTo("step", @get("currentStep") + 1)
