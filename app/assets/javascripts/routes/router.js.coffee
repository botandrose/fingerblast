Fingerblast.Router = Ember.Router.extend
  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'
      redirectsTo: 'boards.index'

    boards: Ember.Route.extend
      route: '/boards'
      connectOutlets: (router) ->
        router.get('applicationController').connectOutlet('boards', Fingerblast.Board.all())
      showBoard: (router, event) ->
        router.transitionTo('board.index', event.context)

      index: Ember.Route.extend
        route: '/'

      board: Ember.Route.extend
        route: '/:board_id'
        connectOutlets: (router, board) ->
          router.get('applicationController').connectOutlet('board', board)
          router.get('boardController').connectOutlet('difficulties', board.get('difficulties'))
        showDifficulty: (router, event) ->
          router.transitionTo('difficulty.index', event.context)

        index: Ember.Route.extend
          route: '/'

        difficulty: Ember.Route.extend
          route: '/:difficulty_id'
          connectOutlets: (router, difficulty) ->
            if typeof(difficulty) == "string"
              difficulty = router.get("boardController").get("content").get("difficulties").find((diff) -> diff.id == difficulty)
            router.get('boardController').connectOutlet('difficulty', difficulty)
          showStep: (router, event) ->
            router.transitionTo('step', event.context)

          index: Ember.Route.extend
            route: '/'

