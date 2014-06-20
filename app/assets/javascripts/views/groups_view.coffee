###
 FIXME: http://stackoverflow.com/questions/11748164/ember-js-and-jquery-sortable-how-to-work-around-the-metamorph-scripts
###


@Todos.GroupsView = Ember.View.extend
  classNames: ['viewport']
  tagName: 'ul'
  willInsertElement: ->
    @sizeContainers()
    $(window).on "resize", _.bind(@sizeContainers,@)
  willClearRender: ->
    console.log "willClearRender"
  didInsertElement: ->
    console.log "didInsert"
    $("#drawer").sortable({
      items: "> ul > li",
      update:  _.bind(@onSortableUpdate,@)
    })
    #@onSelectedChange()
  willDestroyElement: ->
    $(window).off "resize"

  onSortableUpdate: ->
    @get("controller").send("updateSorting",$("#drawer").sortable("toArray",{attribute: "data-id" }))
    $("#drawer").sortable('cancel')
  sizeContainers: ->
    maxWidth = 300;
    windowWidth = $(window).width()
    drawerWidth = windowWidth * 0.2
    drawerWidth = 300 if drawerWidth > 300
    drawerWidth = 150 if drawerWidth < 150
    contentWidth = windowWidth - drawerWidth
    contentWidth = 500 unless contentWidth > 500

    @$("#drawer").width(drawerWidth)
    @$("#content").width(contentWidth).css('left',drawerWidth)

@Todos.GroupsNewView = Ember.View.extend
  editMode: false
  onBodyClick: ->
    @bodyClickFunc || @bodyClickFunc = _.bind(@saveAndExit,@)
  saveAndExit: ->
    name = $.trim(@$("input").val())
    name = "New List" if name.length < 1
    @get("controller").send("create",name)
    @exit()
  exit: ->
    @$("span").show()
    @$("input").hide()
    @editMode = false
    $("body").off("click",@onBodyClick())
  keyUp: (e) ->
    if @editMode and e.which is 27
      @exit()
  submit: ->
    @saveAndExit()
    false
  click: (e) ->
    unless @editMode
      @editMode = true
      @$("span").hide()
      @$("input").val("New List").show().focus().get(0).select()
      $("body").off("click",@onBodyClick())
      $("body").one("click",@onBodyClick())
    false

@Todos.GroupsGroupView = Ember.View.extend
  attributeBindings: ['data-id']
  tagName: "li"
  editing: false
  didInsertElement: ->
    console.log "groups group view insert"
  willClearRender: ->
    console.log "groups group view willClearRender"
  onBodyClick: ->
    @bodyClickFunc || @bodyClickFunc = _.bind(@saveAndExit,@)
  saveAndExit: ->
    id = @$("input:hidden").val()
    name = @$("input:text").val()
    @get("controller").send("update",{ id: id, name: name})
    @exit()
  exitWithoutSave: ->
    id = @$("input:hidden").val()
    store = @get("controller").store
    store.find("group",id).then (group) ->
      group.rollback()
    @exit()
  exit: ->
    @$(".group-edit").hide()
    @$("a").show()
    $("body").off("click",@onBodyClick())
    @editing = false
  keyUp: (e) ->
    if @editing and e.which is 27
      @exitWithoutSave()
    else if @editing and e.which is 13
      @saveAndExit()
  click: (e) ->
    unless @editing
      $("body").trigger("click")
    e.stopPropagation()
  doubleClick: (e) ->
    unless @editing
      @editing = true
      @$(".group-edit").show().focus().get(0).select()
      @$("a").hide()
      $("body").off("click",@onBodyClick())
      $("body").one("click",@onBodyClick())
  submit: (e) ->
    @saveAndExit()
    false

@Todos.GroupDeleteView = Ember.View.extend
  click: (e) ->
    #id = @$("input:hidden").val()
    if confirm("For reals delete?")
      @get("controller").send("delete")
    false
