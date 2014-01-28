activate_input = @Lib.activate_input
okCancelEvents = @Lib.okCancelEvents

Template.new_group.rendered = ->
  activate_input(@find('#new-group'))

Template.new_group.helpers
  creating_group: ->
    Session.get 'creating_group'

Template.new_group.events
  'click .new-group-link': (evt, tmpl) ->
    evt.preventDefault()
    Session.set 'creating_group', true
    Session.set 'selected_group', null

Template.new_group.events okCancelEvents('#new-group',
  ok: (text, evt) ->
    Groups.insert(name: text, timestamp: new Date().getTime())
    evt.target.value = ""
    Session.set 'creating_group', false
  cancel: ->
    Session.set 'creating_group', false
)

