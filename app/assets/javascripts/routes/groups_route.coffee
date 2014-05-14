@Todos.GroupsRoute = Ember.Route.extend
  model: (params) ->
    console.log("groups params",params)
    this.store.find("group")
