@Todos.TodosNewView = Ember.View.extend
  submit: (e) ->
    title = @$("input:text").val()
    group_id = @get("controller").get("id")
    # TODO: Add a way to add starred and due date
    @get("controller").send("create",{ title: title, group_id: group_id })
    @$("input:text").val("")
    false

@Todos.TodosTodoView = Ember.View.extend
  change: (e) ->
    id = @$("input:hidden").val()
    checked = @$("input:checkbox").is(":checked")
    @get("controller").send("updateTodoCompleted",{ id: id, completed: checked })
    #updateTodoName
