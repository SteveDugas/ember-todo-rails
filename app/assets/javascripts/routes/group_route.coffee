@Todos.GroupRoute = Ember.Route.extend
  model: (params) ->
    @store.find("group",params["group_id"])
