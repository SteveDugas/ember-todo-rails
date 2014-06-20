# @Todos.TodosView = Ember.View.extend
  # animateOut: (done) ->
    # console.log("animate out")
    # setTimeout ->
      # done()
    # , 500

@Todos.TodosNewView = Ember.View.extend
  submit: (e) ->
    title = @$("input:text").val()
    group_id = @get("controller").get("controllers.group").get("id")
    # TODO: Add a way to add starred and due date
    console.log 'new', { title: title, group_id: group_id }
    @get("controller").send("create",{ title: title, group_id: group_id })
    @$("input:text").val("")
    false

@Todos.TodosTodoView = Ember.View.extend
  change: (e) ->
    checked = @$("input:checkbox").is(":checked")
    @get("controller").send("updateTodoCompleted",checked)
  willAnimateIn: ->
    console.log "willAimateIn"
    #@$().hide()
  # didAnimateIn: ->
    # console.log "didAnimate"
  # animateIn: (done) ->
    # #@$().fadeIn()

@Todos.TodosStarView = Ember.View.extend
  classNames: ["star"]
  classNameBindings: ['starred']
  starred: (->
    window.store = @get("controller").store
    @get("controller").get("starred")
  ).property("starred")
  click: (e) ->
    @get("controller").send("toggleStarred")