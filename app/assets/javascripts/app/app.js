GithubScore = Ember.Application.create({
  ready: function() {
    GithubScore.initialize();
  }
});

Ember.Application.reopen({
  setupStateManager: function(stateManager) {
    var location = Ember.get(stateManager, 'location');

    if (typeof location === 'string') {
      location = Ember.Location.create({implementation: location});
      Ember.set(stateManager, 'location', location);
    }

    stateManager.route(location.getURL());
    location.onUpdateURL(function(url) {
      stateManager.transitionTo('root');
      stateManager.route(url);
    });
  }
});