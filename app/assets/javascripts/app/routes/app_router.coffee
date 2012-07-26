GithubScore.Router = Ember.Router.extend(
  enableLogging: true
  location: "hash"
  root: Ember.Route.extend(

    # EVENTS
    goHome: Ember.Route.transitionTo("home")
    viewProfile: Ember.Route.transitionTo("profile.index")
    viewEvents: Ember.Route.transitionTo("events.index")

    # STATES
    home: Ember.Route.extend(
      route: "/"
      connectOutlets: (router, context) ->
        appController = router.get("applicationController")

        #appController.connectOutlet('navbar', App.NavbarView);
        appController.connectOutlet "home"
    )
    # STATES
    events: Ember.Route.extend(
      route: "/events"
      index: Ember.Route.extend
        route: "/"
        connectOutlets: (router, context) ->
          eventsController = router.get("applicationController")
          eventsController.connectOutlet 'usernameSearch'
          Ember.Route.transitionTo("waitingForInput")
    )
    profile: Ember.Route.extend(
      route: "/profile"
      redirectTo: 'index'
      connectOutlets: (router, context) ->
        router.get("applicationController").connectOutlet "profile"

      index: Ember.Route.extend
        route: "/"
        connectOutlets: (router, context) ->
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
    waitingForInput: Ember.Route.extend(
      populateEvents: (router, username) ->
        events = GithubScore.Event.find(username: username)
        router.get("eventsController").set "content", events
    )
  )
)

