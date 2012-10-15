require "../app/javascripts/models/whistle.js.coffee"

it "whistles if Audio is defined", ->
  spy = sinon.spy()
  class global.Audio
    play: spy

  whistle = Fingerblast.Whistle.create()
  whistle.play()

  assert.calledOnce spy

it "performs a noop if Audio is not defined", ->
  whistle = Fingerblast.Whistle.create()
  whistle.play()
