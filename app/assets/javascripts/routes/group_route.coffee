@Todos.GroupRoute = Ember.Route.extend
  model: (params) ->
    console.log "group route"
    window.store = this.store
    this.store.find("group",params["group_id"])
  #renderTemplate: ->
  #  this.render('todo')
