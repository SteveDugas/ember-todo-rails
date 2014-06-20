#= require jquery
#= require jquery.ui.sortable
#= require handlebars
#= require underscore
#= require ember
#= require ember-data
#= require ember-animate
#= require_self
#= require todos

AUTH_TOKEN = $("meta[name='csrf-token']").attr("content")

$(document).ajaxSend( (event, request, options) ->
  request.setRequestHeader("X-CSRF-Token", AUTH_TOKEN)
)