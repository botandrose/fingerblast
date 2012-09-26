Fingerblast.Whistle = Ember.Object.extend
  init: ->
    @audio = new Audio("/audios/whistle.mp3") if Audio?

  play: ->
    @audio.play() if @audio?
