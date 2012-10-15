require "../app/javascripts/data/data.js.coffee"
require "../app/javascripts/models/difficulty.js.coffee"

describe "Difficulty", ->
  describe ".findAllByBoardId", ->
    it "returns all the difficulties with a given board id", ->
      difficulties = Fingerblast.Difficulty.findAllByBoardId("metolius3d")
      difficulties.should.have.length 15
      difficulties.forEach (difficulty) ->
        difficulty.boardId.should.equal "metolius3d"
