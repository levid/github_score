GithubScore.Router = Ember.Router.extend(
  enableLogging: true
  location: "hash"
  root: Ember.Route.extend(

    # EVENTS
    goHome: Ember.Route.transitionTo("home")
    viewProfile: Ember.Route.transitionTo("profile.index")

    # STATES
    home: Ember.Route.extend(
      route: "/"
      connectOutlets: (router, context) ->
        appController = router.get("applicationController")

        #appController.connectOutlet('navbar', App.NavbarView);
        appController.connectOutlet "home"
    )
    profile: Ember.Route.extend(
      route: "/profile"
      redirectTo: 'index'
      connectOutlets: (router, context) ->
        router.get("applicationController").connectOutlet "profile"

      index: Ember.Route.extend
        route: "/"
        connectOutlets: (manager) ->
          console.log('index')

      # EVENTS
      viewPosts: Ember.Route.transitionTo("posts")
      viewPhotos: Ember.Route.transitionTo("photos")

      # STATES
      posts: Ember.Route.extend(
        route: "/posts"
        connectOutlets: (router, context) ->
          router.get("profileController").connectOutlet "posts"
      )
      photos: Ember.Route.extend(
        route: "/photos"
        connectOutlets: (router, context) ->
          router.get("profileController").connectOutlet "photos"
      )
    )
  )
)