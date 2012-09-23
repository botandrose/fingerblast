Fingerblast.Whistle = Ember.Object.extend().reopenClass
  play: ->

if Audio?
  Fingerblast.Whistle.reopenClass
    audio: new Audio("/audios/whistle.mp3")

    play: ->
      @audio.play()
