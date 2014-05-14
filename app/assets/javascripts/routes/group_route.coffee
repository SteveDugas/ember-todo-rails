@Todos.GroupRoute = Ember.Route.extend
  model: (params) ->
    this.store.find("group",params["group_id"])
  setupController: (controller, model) ->
    this.controllerFor('groups').set("selectedGroupId",model.get("id"));
    controller.set("model",model)