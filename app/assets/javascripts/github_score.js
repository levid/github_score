//= require ./store
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./helpers
//= require_tree ./templates
//= require_tree ./routes
//= require_self

var router = GithubScore.router = GithubScore.Router.create({
  location: 'hash'
});

GithubScore.initialize(router);

