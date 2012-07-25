GithubScore.Router = Ember.Router.extend({
  initialState: 'root',
  root: Ember.State.extend({
    initialState: 'index',
    index: Ember.State.extend({
      route: '/',
      redirectsTo: 'main',

      // You'll likely want to connect a view here.
      connectOutlets: function(router) {
        console.log("In Root");
        var appController = router.get('applicationController');
        appController.connectOutlet(EmberRailsTestNew.ApplicationView);
      }
      // Layout your routes here...
    }),
    main: Ember.State.extend({
      route: '/main',

      setupControllers: function(router) {
        var eventsController = router.get('eventsController');
        eventsController.set('content', Event.find());
      },

      index: Ember.State.extend({
        route: '/',

        connectOutlets: function(router) {
          console.log("In Home");
          var appController = router.get('homeController');
          appController.connectOutlet('main');
        },
      })
    })
  })
});