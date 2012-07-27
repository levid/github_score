GithubScore.Actor = DS.Model.extend
  blog: DS.attr("string")
  company: DS.attr("string")
  email: DS.attr("string")
  gravatarId: DS.attr("string")
  location: DS.attr("string")
  login: DS.attr("string")
  name: DS.attr("string")
  actorType: DS.attr("string")
  events: DS.hasMany("GithubScore.Event")

GithubScore.Actor.reopenClass url: "actor"