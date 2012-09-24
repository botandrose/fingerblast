#= require sprintf

Fingerblast.Difficulty = Ember.Object.extend
  multiplier: 1.0

  formattedMultiplier: ( ->
    sprintf "x%.1f", @get("multiplier")
  ).property("multiplier")


  fullTitle: ( ->
    "#{@get('title')} x#{@get('multiplier')}"
  ).property("multiplier", "title")

  isPaused: false

  currentStep: null

  currentStepHtml: ( ->
    step = @get("steps")[@get("currentStep") - 1]
    args = step[1..]
    args = args.map (value) =>
      Math.round value * @get("multiplier")
    step = step[0]
    sprintf step, args...
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
