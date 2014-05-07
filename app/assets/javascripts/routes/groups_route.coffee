@Todos.GroupsRoute = Ember.Route.extend
  model: ->
    this.store.find("group")
