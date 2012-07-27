GithubScore = Ember.Application.create(
  ready: ->
    DS.Model.reopen namingConvention:
      keyToJSONKey: (key) ->
        Ember.String.decamelize key

      foreignKey: (key) ->
        Ember.String.decamelize key

    GithubScore.initialize()
)

Ember.Application.reopen setupStateManager: (stateManager) ->
  location = Ember.get(stateManager, "location")
  if typeof location is "string"
    location = Ember.Location.create(implementation: location)
    Ember.set stateManager, "location", location

  stateManager.route location.getURL()

  location.onUpdateURL (url) ->
    stateManager.transitionTo "root"
    stateManager.route url

window.GithubScore = GithubScore