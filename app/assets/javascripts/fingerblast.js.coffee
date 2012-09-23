#= require jquery
#= require handlebars
#= require ember

#= require_self

#= require_tree ./data
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes

window.Fingerblast = Ember.Application.create()

# = re # quire_self
# = re # quire fingerblast/whistle
# = re # quire fingerblast/slideshow
# = re # quire fingerblast/boardSelector
# = re # quire fingerblast/data
# 
# class window.Fingerblast
#   constructor: ->
#     new Fingerblast.BoardSelector $("#boards")
