# This file is loaded first

Session.set 'selected_feature', null
Session.set 'creating_feature', false

handlebar_helpers =
  formChecked: (condition, options) ->
    condition = not condition if options.hash.negate
    'checked' if condition
  formDisabled: (condition, options) ->
    condition = not condition if options.hash.negate
    'disabled' if condition
  valueIf: (condition, options) ->
    condition = not condition if options.hash.negate
    options.hash.value if condition


Handlebars.registerHelper(name, helper) for name, helper of handlebar_helpers
