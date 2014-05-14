@Todos.Group = DS.Model.extend
  name: DS.attr("string")
  todos: DS.hasMany("todo", {async: true})
  completedCount: (->
    @get("todos").filterBy('completed', true).get('length');
  ).property('todos.@each.completed')
