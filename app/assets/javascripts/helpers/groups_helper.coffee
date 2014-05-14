Ember.Handlebars.helper("todoCheckbox", (val,options) ->
  if val
    checked = """checked="checked" """
  else
    checked = ""
  return new Handlebars.SafeString("""<input type="checkbox" #{checked}>""")
)