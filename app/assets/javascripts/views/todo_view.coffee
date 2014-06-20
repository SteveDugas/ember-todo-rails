@Todos.TodoView = Ember.View.extend
  classNames: ["todo-parent"]
  animateIn: (done) ->
    panelWidth = $("#content").width() - 300
    $("#content").animate({
      width: panelWidth
      #paddingRight: 300
    },500,done)
  animateOut: (done) ->
    panelWidth = $("#content").width() + 300
    $("#content").animate({
      width: panelWidth
    },500,done)
