Fingerblast.Board = Ember.Object.extend().reopenClass(
  all: ->
    Fingerblast.data.boards.map (props) ->
      Fingerblast.Board.create().setProperties(props)

  find: (id) ->
    @all().find (board) -> board.id == id

).reopen

  imagePath: (->
    "/#{@id}.jpg"
  ).property()

  groupedDifficulties: (->
    difficulties = Fingerblast.Difficulty.findAllByBoardId @id
    difficulties = difficulties.groupBy "title"
    for key, value of difficulties
      title: key
      variants: value
  ).property("id")
