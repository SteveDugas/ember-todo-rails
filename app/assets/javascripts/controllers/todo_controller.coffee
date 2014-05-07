@Todos.TodoController = Ember.ObjectController.extend
  actions:
    submit: ->
      @get("model").save()
      @transitionToRoute("todos")
