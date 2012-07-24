GithubScore.Router = Ember.Router.extend({
  initialState: 'root',
  root: Ember.State.extend({
    initialState: 'index',
    index: Ember.State.extend({
      route: '/',
      connectOutlets: function(router) {
        console.log(router);
        router.get('eventsController').connectOutlet('main');
      }
    })
  })
});

