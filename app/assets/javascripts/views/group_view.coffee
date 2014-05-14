@Todos.GroupView = Ember.View.extend
  didInsertElement: ->
    console.log("id from group view",@get("controller").get("id"))
    id = @get("controller").get("id")
    console.log("id from group",id)
    $("#drawer li.selected").removeClass("selected")
    console.log($("#drawer li[data-id=#{id}]"))
    $("#drawer li[data-id=#{id}]").addClass("selected")
