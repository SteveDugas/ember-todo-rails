@Todos.Router.map ()->
  @resource "groups", ->
    @resource "group", { path: ":group_id" }, ->
      @resource "todos", { path: "todos" }, ->
        @resource "todo", { path: ':todo_id' }
