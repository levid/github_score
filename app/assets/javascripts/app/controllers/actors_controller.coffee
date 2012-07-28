GithubScore.ActorsController = Ember.ArrayController.extend
  content: []
  init: ->
    console.log "actors controller started"

  actors: (->
    GithubScore.Actor.find({username: 'wycats'})
  ).property("@each").cacheable()

  firstObject: (->
    @objectAt(0)
  ).property('@each')

# Implement your controller here.
#
# An ArrayController has a `content` property, which you should
# set up in your router.