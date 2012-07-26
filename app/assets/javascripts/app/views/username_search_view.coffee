GithubScore.UsernameSearchView = Ember.TextField.extend

  insertNewline: ->
    username = @get("value")
    @get("controller").populateEvents(username)