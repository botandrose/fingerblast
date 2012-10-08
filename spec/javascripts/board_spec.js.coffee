require "fingerblast/data/data.js.coffee"
require "fingerblast/models/board.js.coffee"
require "fingerblast/models/difficulty.js.coffee"
require "fingerblast/helpers/array_extensions.js"

describe "Board", ->
  describe "#groupedDifficulties", ->
    [subject, difficulty, variant] = [null, null, null]

    beforeEach ->
      subject = Fingerblast.Board.all()[0]
      difficulty = subject.get("groupedDifficulties")[0]
      variant = difficulty.variants[0]

    it "has three difficulty groups", ->
      subject.get("groupedDifficulties").should.have.length(3)

    it "has a beginner difficulty group", ->
      difficulty.should.have.property "title", "Beginner"

    it "has four variants for each difficulty", ->
      difficulty.variants.should.have.length(4)

    it "has a variant with a multiplier", ->
      variant.get("multiplier").should.eql(0.5)

    it "has a variant with a constructed id", ->
      # variant.get("id").should.eql "metolius3d-beginner-0"
