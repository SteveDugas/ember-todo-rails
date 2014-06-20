@Todos.GroupController = Ember.ObjectController.extend
  needs: ["groups"]
  actions:
    delete: ->
      @get("model").destroyRecord()
    update: ->
      @get("model").save()
