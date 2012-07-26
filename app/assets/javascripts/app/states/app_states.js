// GithubScore.StateManager = Ember.StateManager.extend({
//   initialState: 'bootstrap',
//
//   state: {
//     bootstrap: Ember.State.extend({
//       ready: function(manager) {
//         // put your bootstrap logic here
//         var store = DS.Store.create({
//           revision: 4,
//           adapter: DS.RESTAdapter.create({
//             mappings: {
//               actors: GithubScore.Actor
//             }
//           })
//         });
//
//         manager.set('store', store);
//         manager.goToState('waitingForInput');
//
//         var view = Ember.View.create({
//           controller: manager.get('eventsController'),
//           templateName: 'main'
//         }).append();
//
//         // view.appendTo('#wrapper');
//       }
//     }),
//     waitingForInput: Ember.State.extend({
//       populateEvents: function(manager, username) {
//         var events = GithubScore.Event.find({ username: username });
//         manager.get('eventsController').set('content', events)
//       }
//     })
//   }
// })