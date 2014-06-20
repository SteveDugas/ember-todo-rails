@Todos.GroupsController = Ember.ArrayController.extend
  itemController: 'group'
  sortProperties: ['sort_order']
  actions:
    create: (name) ->
      @store.createRecord "group",
        name: name
        sort_order: @get("length")+1
      .save().then (group) =>
        @transitionToRoute("todos",group.get "id")
    updateSorting: (idsInOrder) ->
      # TODO: How to save multiple models at once?
      console.log idsInOrder
      _.each idsInOrder, (val,idx) =>
        group = @findBy("id",idsInOrder[idx])
        group.set("sort_order",idx)
        group.get("model").save()
      #@forEach (group,idx) ->
      #  group.set("sort_order",idsInOrder[idx])
        #group.get("model").save()
      #@get("store").commit()
      # find all groups, update their order, save
      # can I save all at once?
