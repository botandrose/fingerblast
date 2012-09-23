Fingerblast.Router = Ember.Router.extend
  enableLogging: true

  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'
      redirectsTo: 'boards.index'

    showBoards: (router, event) ->
      router.transitionTo('root.index')

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

        success: Ember.Route.extend
          route: '/success'
          connectOutlets: (router) ->
            router.get('boardController').connectOutlet('success')

        difficulty: Ember.Route.extend
          route: '/difficulties/:difficulty_id'
          connectOutlets: (router, difficulty) ->
            if typeof(difficulty) == "string"
              difficulty = router.get("boardController").get("content").get("difficulties").find((diff) -> diff.id == difficulty)
            router.get('boardController').connectOutlet('difficulty', difficulty)
            router.transitionTo('step', 1) unless difficulty.get("currentStep")?

          index: Ember.Route.extend
            route: '/'

          step: Ember.Route.extend
            route: '/:step'
            connectOutlets: (router, step) ->
              router.set('difficultyController.content.currentStep', step)
              router.get('difficultyController.content').startCountdown()
            serialize: (router, context) ->
              step: context
            deserialize: (router, urlParams) ->
              parseInt urlParams.step

            pause: (router, event) ->
              router.get('difficultyController.content').pause()

            unpause: (router, event) ->
              router.get('difficultyController.content').unpause()

