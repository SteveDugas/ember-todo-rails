@Todos.TodosController = Ember.ObjectController.extend
  actions:
    create: (obj) ->
      todo = @store.createRecord "todo", { title: obj.title }
      @store.find("group", obj.group_id).then (group) =>
        group.get("todos").pushObject(todo)
        todo.save()
    updateTodoCompleted: (obj) ->
      @store.find("todo",obj.id).then (todo) =>
        todo.set("completed",obj.completed)
        todo.save()
    updateTodoName: (obj) ->
      @store.find("todo",obj.id).then (todo) =>
        todo.set("title",obj.title)
        todo.save()
