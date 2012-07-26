GithubScore.Router = Ember.Router.extend(
  enableLogging: true
  location: "hash"
  root: Ember.Route.extend

    # EVENTS
    goHome: Ember.Route.transitionTo("home")
    viewProfile: Ember.Route.transitionTo("profile")

    # STATES
    home: Ember.Route.extend
      route: "/"
      connectOutlets: (router, context) ->
        appController = router.get("applicationController")

        #appController.connectOutlet('navbar', App.NavbarView);
        appController.connectOutlet "home"

    profile: Ember.Route.extend
      route: "/profile"
      connectOutlets: (router, context) ->
        router.get("applicationController").connectOutlet "profile"


      # EVENTS
      viewPosts: Ember.Route.transitionTo("posts")
      viewPhotos: Ember.Route.transitionTo("photos")

      # STATES
      posts: Ember.Route.extend
        route: "/posts"
        connectOutlets: (router, context) ->
          router.get("profileController").connectOutlet "posts"

      photos: Ember.Route.extend
        route: "/photos"
        connectOutlets: (router, context) ->
          router.get("profileController").connectOutlet "photos"