Handlebars.registerHelper(name, helper) for name, helper of {

  formChecked: (condition, options) ->
    condition = not condition if options.hash.negate
    'checked' if condition

  formDisabled: (condition, options) ->
    condition = not condition if options.hash.negate
    'disabled' if condition

  valueIf: (condition, options) ->
    condition = not condition if options.hash.negate
    options.hash.value if condition
}
