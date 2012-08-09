class Fingerblast.Slideshow
  constructor: (@e, @data) ->
    @counter = -1
    @roundLength = 60
    @slideIndex = 0
    @whistle = new Fingerblast.Whistle()

    @originalMarkup = @e.find("section").html()
    @tick()
    @interval = window.setInterval (=> @tick()), 1000

  tick: ->
    @counter += 1
    @updateCounter @counter
    @slideIndex = Math.floor(@counter / @roundLength)

    if @data[@slideIndex]?
      isNewSlide = @counter % @roundLength == 0
      if isNewSlide
        @e.find("section").html @data[@slideIndex]
        @whistle.play()
    else
      window.clearInterval @interval
      @done()

  updateCounter: ->
    countdown = @roundLength - (@counter % @roundLength)
    @e.find("#counter").html countdown

  done: ->
    $("#slideshow").html("<h1>Master Fingerblaster!</h1><button onclick='window.location.reload()'>Fingerblast again</button>")
