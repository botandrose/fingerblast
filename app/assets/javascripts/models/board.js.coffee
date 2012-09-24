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
    data = Fingerblast.data.difficulties.filter( (difficulty) =>
      difficulty.boardId == @id
    ).map( (props) ->
      title: props.title
      variants: [0.5, 1.0, 1.5, 2.0].map (multiplier) ->
        props.multiplier = multiplier
        Fingerblast.Difficulty.create().setProperties(props)
    )
    data
  ).property("id")
