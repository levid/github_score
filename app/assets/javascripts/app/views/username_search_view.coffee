GithubScore.UsernameSearchView = Ember.TextField.extend
  templateName: "app/templates/main"

  insertNewline: ->
    username = @get("value")
    @get("router").send "populateEvents", username