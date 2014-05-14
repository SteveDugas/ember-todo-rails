@Todos.GroupsController = Ember.ArrayController.extend
  actions:
    create: (name) ->
      @store.createRecord "group",
        name: name
      .save()
    delete: (id) ->
      @store.find('group', id).then (group) ->
        group.destroyRecord()
    update: (todo) ->
      @store.find('group', todo.id).then (group) ->
        group.set("name", todo.name).save()

  groupIdObserver: (->
    id = @get("selectedGroupId")
    $("#drawer li.selected").removeClass "selected"
    $("#drawer li[data-id=#{id}]").addClass "selected"
  ).observes("selectedGroupId")