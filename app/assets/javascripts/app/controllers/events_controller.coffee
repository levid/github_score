GithubScore.EventsController = Ember.ArrayController.extend
  populateEvents: (username) ->
    events = GithubScore.Event.find
      username: username

    @getPath('target.eventsController').set "content", events

  score: (->
    score = 0
    @forEach ((event) ->
      score += @scoreFor(event)
    ), this
    score
  ).property("@each.eventType")

  username: (->
    firstEvent = @objectAt(0)
    firstEvent = firstEvent.getPath("actor") if firstEvent
    firstEvent
  ).property("@each").cacheable()

  scoreFor: (event) ->
    switch event.get("eventType")
      when "CommitCommentEvent", "IssueCommentEvent"
        return 2
      when "IssuesEvent", "CreateEvent"
        return 3
      when "WatchEvent", "FollowEvent"
        return 1
      when "PushEvent"
        return 7
      when "PullRequestEvent"
        return 5
      else
        return 1