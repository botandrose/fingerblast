require "fingerblast/data/data.js.coffee"
require "fingerblast/models/difficulty.js.coffee"

describe "Difficulty", ->
  describe ".findAllByBoardId", ->
    it "returns all the difficulties with a given board id", ->
      difficulties = Fingerblast.Difficulty.findAllByBoardId("metolius3d")
      difficulties.should.have.length 3
      difficulties.forEach (difficulty) ->
        difficulty.boardId.should.equal "metolius3d"

  describe "findAllByBoardIdGrouped", ->
    [subject, difficulty, variant] = [null, null, null]

    beforeEach ->
      subject = Fingerblast.Difficulty.findAllByBoardIdGrouped("metolius3d")
      difficulty = subject[0]
      variant = difficulty.variants[0]

    it "has three difficulty groups", ->
      subject.should.have.length(3)

    it "has a beginner difficulty group", ->
      difficulty.should.have.property "title", "Beginner"

    it "has four variants for each difficulty", ->
      difficulty.variants.should.have.length(4)

    it "has a variant with a multiplier", ->
      variant.get("multiplier").should.eql(0.5)

    it "has a variant with a constructed id", ->
      # variant.get("id").should.eql "metolius3d-beginner-0"
