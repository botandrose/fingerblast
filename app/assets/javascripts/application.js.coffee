#= require jquery
#= require slideshow
#= require data

$ ->
  $("button").live "click", (e) ->
    e.preventDefault()
    difficulty = parseInt $(this).data("difficulty")
    new Fingerblast.Slideshow $("#slideshow"), Fingerblast.data, difficulty
