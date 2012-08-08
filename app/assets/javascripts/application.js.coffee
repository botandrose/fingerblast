#= require jquery
#= require slideshow
#= require data

$ ->
  $("form").submit (e) ->
    e.preventDefault()
    difficulty = parseInt $("input:checked").val()
    new Fingerblast.Slideshow $("#slideshow"), Fingerblast.data, difficulty
