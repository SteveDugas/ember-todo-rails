@Todos.TodoRoute = Ember.Route.extend
  model: (params) ->
    this.store.find("todo",params["todo_id"])
  renderTemplate: ->
    this.render('todo')
