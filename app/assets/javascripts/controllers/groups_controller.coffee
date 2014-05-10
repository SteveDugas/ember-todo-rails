@Todos.GroupsController = Ember.ArrayController.extend
  actions:
    create: (name) ->
      @store.createRecord "group",
        name: name
      .save()
    delete: (id) ->
      console.log("gonna delete id",id, typeof id)
      @store.find('group', id).then (group) ->
        console.log(group)
        group.destroyRecord()
      #group.save()
    new: ->
      # @store.createRecord "group",
        # name: "New List"
      #.save()
      # wait to save until the input is done
      # make a new view for that


