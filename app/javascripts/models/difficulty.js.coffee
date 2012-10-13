#= require sprintf

Fingerblast.Difficulty = Ember.Object.extend().reopenClass(
  data: Fingerblast.data.difficulties

  all: ->
    @data.map (props) =>
      @create props

  findAllByBoardId: (boardId) ->
    @all().filter (difficulty) ->
      difficulty.boardId == boardId

  find: (id) ->
    @all().find (difficulty) -> difficulty.id == id

).reopen
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
    if args?
      args = args.map (value) =>
        Math.round value * @get("multiplier")
      step = step[0]
      sprintf step, args...
    else
      step
  ).property("steps", "currentStep")

  currentHolds: ( ->
    @get("steps")[@get("currentStep") - 1][2]
  ).property("steps", "currentStep")

  defaultCountdown: 60

  countdown: null

  startCountdown: ->
    @set("countdown", @defaultCountdown)
    @unpause()
    Fingerblast.whistle.play()

  pause: ->
    window.clearInterval(window.interval) if window.interval?
    @set("isPaused", true)

  unpause: ->
    window.clearInterval(window.interval) if window.interval?
    window.interval = window.setInterval (=> @tick()), 1000
    @set("isPaused", false)

  skip: ->
    if @get("steps").length == @get("currentStep")
      Fingerblast.router.transitionTo("success")
    else
      Fingerblast.router.transitionTo("step", @get("currentStep") + 1)

  # private

  tick: ->
    @decrementProperty("countdown")
    if @get("countdown") == 0
      window.clearInterval window.interval
      @skip()
