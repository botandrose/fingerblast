window.Fingerblast = {}

class Fingerblast.Slideshow
  constructor: (@e, @data) ->
    @counter = -1
    @difficultyIndex = 0
    @audio = new Audio("/audios/whistle.ogg")
    window.setInterval (=> @tick()), 1000

  tick: ->
    @counter += 1
    @e.find("#counter").html @counter
    if @data[@counter]?
      @e.find("section").html @data[@counter][@difficultyIndex]
      @audio.play()
