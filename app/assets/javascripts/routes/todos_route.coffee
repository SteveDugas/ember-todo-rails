@Todos.TodosRoute = Ember.Route.extend
  model: (params) ->
    @modelFor("group").get("todos")
