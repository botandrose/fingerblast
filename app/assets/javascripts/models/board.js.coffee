Fingerblast.Board = Ember.Object.extend().reopenClass(

  all: ->
    [
      Fingerblast.Board.create id: "metolius3d", title: "Metolius 3D"
      Fingerblast.Board.create id: "compact_wood", title: "Compact Wood"
      Fingerblast.Board.create id: "pureforce", title: "Pure Force"
    ]

  find: (id) ->
    @all().find (board) -> board.id == id

).reopen

  imagePath: (->
    "/assets/#{@id}.jpg"
  ).property()

  difficulties: (->
    Fingerblast.Difficulty.all()
  ).property()
