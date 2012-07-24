GithubScore.Event = DS.Model.extend({
  actor: DS.attr('references'),
  payload: DS.attr('string'),
  public: DS.attr('boolean'),
  repository: DS.attr('string'),
  type: DS.attr('string'),
  url: DS.attr('string')
});