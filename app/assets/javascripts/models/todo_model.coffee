@Todos.Todo = DS.Model.extend
  title: DS.attr("string")
  details: DS.attr("string")
  due: DS.attr("date")
  completed: DS.attr("boolean")
  #group_id: DS.attr()
  group: DS.belongsTo("group", {async: true})
