@Todos.Group = DS.Model.extend
  name: DS.attr("string")
  todos: DS.hasMany("todo", {async: true})
  sort_order: DS.attr("number")