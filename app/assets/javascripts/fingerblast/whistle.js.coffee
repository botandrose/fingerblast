class Fingerblast.Whistle
  constructor: ->
    if Audio?
      @audio = new Audio("/audios/whistle.mp3")

  play: ->
    if @audio?
      @audio.play()
