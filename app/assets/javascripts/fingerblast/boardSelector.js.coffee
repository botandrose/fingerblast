class Fingerblast.BoardSelector
  constructor: (@e) ->
    @data = Fingerblast.data
    @slideshow = Fingerblast.Slideshow
    @boardIndex = null
    @difficultyIndex = null

    @e.find("a").live "click", (e) =>
      e.preventDefault()
      @selectBoard $(e.currentTarget).find("img")

    $("section button").live "click", (e) =>
      e.preventDefault()
      @startSlideshow $(e.currentTarget).data("difficulty-index")

  selectBoard: (boardImg) ->
    @boardIndex = parseInt boardImg.data("board-id")
    $("#boards").hide()
    $("#image").html(boardImg).show()
    $("section").show()

  startSlideshow: (difficultyIndex) ->
    @difficultyIndex = parseInt difficultyIndex
    data = @data[@boardIndex][@difficultyIndex]
    new @slideshow $("#slideshow"), data
