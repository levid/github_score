# GithubScore.mainView = GithubScore.ApplicationView.create()
#
# router = Ember.Router.create
#     location: "hash"
#     enableLogging: true
#
#     root: Ember.State.extend
#         connectOutlets: (manager) ->
#             app_controller = manager.get("applicationController")
#             main_app_view = Ember.ContainerView.create
#                 controller: app_controller
#                 currentViewBinding: 'controller.view'
#
#             main_app_view.appendTo("#main_app_panel")
#
#         index: Ember.State.extend
#             route: "/"
#
#         app: Ember.State.extend
#             connectOutlets: (manager) ->
#                 content_panel_controller = manager.get("contentPanelController")
#                 content_panel_view = Ember.ContainerView.create
#                     controller: content_panel_controller
#                     currentViewBinding: 'controller.view'
#
#                 content_panel_view.appendTo("#content_panel")
#
#             tasks: Ember.State.extend
#                 route: "/tasks"
#
#                 index: Ember.State.extend
#                     route: "/"
#                     connectOutlets: (manager) ->
#                         content_panel_controller = manager.get("contentPanelController")
#                         tasks_controller = manager.get("tasksController")
#
#                         content_panel_controller.set "view", Emee.TasksListView.create
#                             controller: tasks_controller
#
#                 show: Ember.State.extend
#                     route: "/show"
#                     connectOutlets: (manager) ->
#                         app_controller = manager.get("applicationController")
#                         tasks_controller = manager.get("tasksController")
#
#             users: Ember.State.extend
#                 route: "/users"
#
#                 index: Ember.State.extend
#                     route: "/"
#
#             calenders: Ember.State.extend
#                 route: "/calenders"
#
#                 index: Ember.State.extend
#                     route: "/"
#
#                 show: Ember.State.extend
#                     route: "/show"
#
# GithubScore.mainView.appendTo('body')
#
# GithubScore.initialize(router)