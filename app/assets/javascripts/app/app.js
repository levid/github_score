GithubScore = Ember.Application.create({
  ready: function() {

    DS.Model.reopen({
      namingConvention: {
        keyToJSONKey: function(key) {
          return Ember.String.decamelize(key);
        },

        foreignKey: function(key) {
          return Ember.String.decamelize(key);
        }
      }
    });

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

