#= require_self
#= require fingerblast/whistle
#= require fingerblast/slideshow
#= require fingerblast/boardSelector
#= require fingerblast/data

class window.Fingerblast
  constructor: ->
    new Fingerblast.BoardSelector $("#boards")
