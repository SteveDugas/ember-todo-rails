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
  request.setRequestHeader("X-CSRF-Token", AUTH_TOKEN)
)