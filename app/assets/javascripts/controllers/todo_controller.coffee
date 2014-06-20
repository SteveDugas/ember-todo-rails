@Todos.TodoController = Ember.ObjectController.extend
  actions:
    submit: ->
      @get("model").save()
      @transitionToRoute("todos")
    updateTodoCompleted: (checked) ->
      todo = @get("model")
      todo.set("completed",checked).save()
    toggleStarred: ->
      todo = @get("model")
      todo.set("starred",!@get("starred")).save()