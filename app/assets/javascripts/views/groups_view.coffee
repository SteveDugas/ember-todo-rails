@Todos.GroupsView = Ember.View.extend
  willInsertElement: ->
    @sizeContainers()
    $(window).on "resize", _.bind(@sizeContainers,@)
  willDestroyElement: ->
    $(window).off "resize"

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
  actions:
    click: ->
      console.log("view click")
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
    if @editMode and e.which is 13
      @saveAndExit()
    if @editMode and e.which is 27
      @exit()
  click: (e) ->
    unless @editMode
      console.log("click")
      @editMode = true
      @$("span").hide()
      @$("input").val("New List").show().focus().get(0).select()
      $("body").off("click",@onBodyClick())
      $("body").one("click",@onBodyClick())
    false

@Todos.GroupDeleteView = Ember.View.extend
  click: (e) ->
    id = @$("input:hidden").val()
    if confirm("For reals delete?")
      @get("controller").send("delete",parseInt(id))
    false
