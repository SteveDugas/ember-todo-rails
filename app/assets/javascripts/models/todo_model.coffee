@Todos.Todo = DS.Model.extend
  title: DS.attr("string")
  details: DS.attr("string")
  due: DS.attr("date")
  completed: DS.attr("boolean")
  starred: DS.attr("boolean")
  group: DS.belongsTo("group", {async: true})
  sort_order: DS.attr("number")
