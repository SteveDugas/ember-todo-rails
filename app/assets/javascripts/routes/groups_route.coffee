@Todos.GroupsRoute = Ember.Route.extend
  model: (params) ->
    this.store.find("group")