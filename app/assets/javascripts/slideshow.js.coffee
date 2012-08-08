window.Fingerblast = {}

class Fingerblast.Slideshow
  constructor: (@e, @data, @difficultyIndex) ->
    @counter = -1
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
    @e.find("#counter").html formatTime(@counter)

  reset: ->
    @e.find("#counter").empty()
    @e.find("section").html @originalMarkup

formatTime = (seconds) ->
  seconds = parseInt(seconds)
  minutes = Math.floor(seconds / 60)
  seconds = seconds - (minutes * 60)

  minutes = "0"+minutes if minutes < 10
  seconds = "0"+seconds if seconds < 10

  "#{minutes}:#{seconds}"
