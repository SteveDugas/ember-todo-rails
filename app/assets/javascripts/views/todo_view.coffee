@Todos.TodoView = Ember.View.extend
  classNames: ["todo-parent"]
  didInsertElement: ->
    panelWidth = $("#content").width() - 300
    $("#content").animate({
      width: panelWidth
      #paddingRight: 300
    },500)
  willDestroyElement: ->
    panelWidth = $("#content").width() + 300
    $("#content").animate({
      width: panelWidth
    },500)
