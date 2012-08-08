window.Fingerblast = {}

class Fingerblast.Slideshow
  constructor: (@e, @data, @difficultyIndex) ->
    @counter = -1
    @roundLength = 60
    @audio = new Audio("/audios/whistle.mp3")
    @interval = window.setInterval (=> @tick()), 1000
    @originalMarkup = @e.find("section").html()

  tick: ->
    @counter += 1
    @updateCounter @counter

    if @data.hasOwnProperty @counter
      if @data[@counter] == null
        window.clearInterval @interval
        @reset()
      else
        @e.find("section").html @data[@counter][@difficultyIndex]
        @audio.play()

  updateCounter: ->
    countdown = @roundLength - (@counter % @roundLength)
    @e.find("#counter").html countdown

  reset: ->
    @e.find("#counter").empty()
    @e.find("section").html @originalMarkup
