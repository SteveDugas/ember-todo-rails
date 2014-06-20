@Todos.TodosController = Ember.ArrayController.extend
  needs: ["groups","group"]
  itemController: 'todo'
  completed: (->
    @filterBy('completed', true)
  ).property('@each.completed')
  uncompleted: (->
    @filterBy('completed', false)
  ).property('@each.completed')
  groupName: (->
    @get("controllers.group").get("name")
  ).property("@each.group.name")
  actions:
    create: (obj) ->
      todo = @store.createRecord "todo", { title: obj.title }
      # FIXME: This can be done more efficiantly probably
      @store.find("group", obj.group_id).then (group) =>
        group.get("todos").then (todos) ->
          todos.pushObject(todo)
          todo.save()