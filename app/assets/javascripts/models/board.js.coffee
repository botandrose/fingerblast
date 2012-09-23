Fingerblast.Board = Ember.Object.extend().reopenClass(
  all: ->
    Fingerblast.data.boards.map (props) ->
      Fingerblast.Board.create().setProperties(props)

  find: (id) ->
    @all().find (board) -> board.id == id

).reopen

  imagePath: (->
    "/assets/#{@id}.jpg"
  ).property()

  difficulties: (->
    Fingerblast.data.difficulties.filter( (difficulty) =>
      difficulty.boardId == @id
    ).map (props) ->
      Fingerblast.Difficulty.create().setProperties(props)
  ).property("id")
