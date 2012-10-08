require "fingerblast/data/data.js.coffee"
require "fingerblast/models/difficulty.js.coffee"

describe "Difficulty", ->
  describe ".findAllByBoardId", ->
    it "returns all the difficulties with a given board id", ->
      difficulties = Fingerblast.Difficulty.findAllByBoardId("metolius3d")
      difficulties.should.have.length 12
      difficulties.forEach (difficulty) ->
        difficulty.boardId.should.equal "metolius3d"
