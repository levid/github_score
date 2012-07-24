//= require ./store
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./helpers
//= require_tree ./templates
//= require_tree ./states
//= require_tree ./routes
//= require_self

var router = GithubScore.router = GithubScore.Router.create({
  enableLogging: true,
  location: 'hash'
});

GithubScore.initialize(router);

// var stateManager = GithubScore.stateManager = GithubScore.StateManager.create({
//
// });
  //
// GithubScore.injectControllers(stateManager);
//
// jQuery(function() {
//   stateManager.send('ready');
// });