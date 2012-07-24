GithubScore.UsernameSearchView = Ember.TextField.extend({
  templateName: 'main',
  insertNewline: function() {
    var username = this.get('value');
    this.get('stateManager').send('populateEvents', username);
  }
});