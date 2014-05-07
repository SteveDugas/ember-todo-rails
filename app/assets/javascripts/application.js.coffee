#= require jquery
#= require handlebars
#= require underscore
#= require ember
#= require ember-data
#= require_self
#= require todos

AUTH_TOKEN = $("meta[name='csrf-token']").attr("content")
AUTH_PARAM = $("meta[name='csrf-param']").attr("content")


$(document).ajaxSend( (event, request, options) ->
  if AUTH_TOKEN? and AUTH_PARAM? and options.data? and _.contains ["GET","PUT","DELETE"], options.type
    data = JSON.parse(options.data)
    data[AUTH_PARAM] = AUTH_TOKEN
    options.data = JSON.stringify(data)
)
    

@Todos = Ember.Application.create()
@Todos.ApplicationAdapter = DS.ActiveModelAdapter.extend();
#@Todos.IndexRoute = Ember.Route.extend
#  redirect: ->
#    @transitionTo("todos")
