GithubScore.Actor = DS.Model.extend({
  blog: DS.attr('string'),
  company: DS.attr('string'),
  email: DS.attr('string'),
  gravatarId: DS.attr('string'),
  location: DS.attr('string'),
  login: DS.attr('string'),
  name: DS.attr('string'),
  type: DS.attr('string')
});