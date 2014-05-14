Ember.Handlebars.helper("createTodoInput", (val,options) ->
  name = "Add an item for \"#{val}\""
  return new Handlebars.SafeString("<input type='text' placeholder='#{name}' id='todo-create-input'>")
)