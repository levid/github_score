GithubScore.Router = Ember.Router.extend({
  enableLogging: true,
  location: 'hash',
  initialState: 'root',

  root: Ember.State.extend({
    initialState: 'index',
    setupControllers: function(router) {
      var applicationController = router.get('applicationController'),
      rootView;

      rootView = Ember.ContainerView.create({
        controller: applicationController,
        currentViewBinding: 'controller.view'
      });

      rootView.appendTo('#content');
    },
    index: Ember.State.extend({
      route: '/',
      redirectsTo: 'main.index'
    }),
    main: Ember.State.extend({
      route: '/main',

      setupControllers: function(router) {
        var eventsController = router.get('eventsController');
        eventsController.set('content', Event.find());
      },

      index: Ember.State.extend({
        route: '/'
      }),

      connectOutlets: function(router) {
        // GithubScore.EventsController.set('content', 'test');
        router.get('eventsController').connectOutlet('main', GithubScore.UsernameSearchView);
      }
    })
  })
});