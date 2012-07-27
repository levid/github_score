GithubScore.UsernameSearchView = Ember.TextField.extend
  # templateName: "app/templates/main"
  controller: (->
    @nearestWithProperty("controller").get "controller"
  ).property("parentView").cacheable()

  insertNewline: ->
    username = @get("value")
    @get("controller").populateEvents(username)