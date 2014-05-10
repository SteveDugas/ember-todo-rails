@Todos.GroupRoute = Ember.Route.extend
  model: (params) ->
    this.store.find("group",params["group_id"])