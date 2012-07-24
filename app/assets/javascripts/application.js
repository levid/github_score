// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require github_score
GithubScore = Ember.Application.create({
  ready: function() {
    // After 3 seconds transition to the 'tasks.show' state
    Ember.run.later(function() {
      console.log("test");
      // GithubScore.get('stateManager').transitionTo('show');
    }, 3000);
  }
});
//= require_tree .

GithubScore.displayError = function(e) {
  if (typeof e === 'string') {
    // display error strings
    alert(e);
  }
  else if (typeof e === 'object' && e.responseText !== undefined) {
    // TODO - further process json errors
    alert(e.responseText);
  }
  else {
    alert("An unexpected error occurred.");
  }
};