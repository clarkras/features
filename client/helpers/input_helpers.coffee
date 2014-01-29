####### Helpers for in-place editing #######

@Lib or= {}

# Returns an event map that handles the "escape" and "return" keys and
# "blur" events on a text input (given by selector) and interprets them
# as "ok" or "cancel"
@Lib.okCancelEvents = (selector, options) ->
  ok = options.ok or ->
  cancel = options.cancel or ->
  submit_on_enter = if options.submit_on_enter? then options.submit_on_enter else true
  events = {}
  events["keyup #{selector}, focusout #{selector}"] = (evt) ->
    if evt.type is 'focusout' or
          submit_on_enter and evt.type is "keyup" and evt.which is 13
      # return/enter = ok/submit if non-empty
      value = String(evt.target.value or "")
      if value
        ok.call this, value, evt
      else
        cancel.call this, evt
  events

@Lib.activate_input = (input) ->
  return unless input
  input.focus()
  input.select()
