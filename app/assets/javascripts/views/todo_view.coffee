@Todos.TodoView = Ember.View.extend
  parentViewDidChange: ->
    console.log "parentViewDidChange todo"
  didInsertElement: ->
    console.log "did insert todo"
  willInsertElmenet: ->
    console.log "will insert todo"
  willClearRender: ->
    console.log "will clear render todo"
