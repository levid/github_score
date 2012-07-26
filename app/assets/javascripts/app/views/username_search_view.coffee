GithubScore.UsernameSearchView = Ember.TextField.extend
  templateName: "main"
  insertNewline: ->
    username = @get("value")
    @get("stateManager").send "populateEvents", username