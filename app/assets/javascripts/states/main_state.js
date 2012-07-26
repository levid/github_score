GithubScore.MainState = Ember.State.extend({
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
});