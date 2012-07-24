GithubScore.Router = Ember.Router.extend({
  initialState: 'root',
  root: Ember.State.extend({
    initialState: 'index',
    index: Ember.State.extend({
      route: '/',
      connectOutlets: function(router) {
        return router.get('eventsController').connectOutlet(GithubScore.UsernameSearchView);
      }
    })
  })
});

