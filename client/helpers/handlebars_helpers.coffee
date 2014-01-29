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

  openHelp: (selector) ->
    dialog_options = "height:400, width:300"
    new Handlebars.SafeString "$('#{selector}').dialog({#{dialog_options}})"

}
