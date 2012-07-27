GithubScore.Event = DS.Model.extend
  public: DS.attr("string")
  repository: DS.attr("string")
  eventType: DS.attr("string")
  url: DS.attr("string")
  actor: DS.belongsTo("GithubScore.Actor")
  payload: DS.attr("string")
  payloadObject: (->
    JSON.parse @get("payload")
  ).property("payload").cacheable()

GithubScore.Event.reopenClass
  url: "event"