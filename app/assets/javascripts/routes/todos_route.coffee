@Todos.TodosRoute = Ember.Route.extend
  model: (params) ->
    this.modelFor("group")