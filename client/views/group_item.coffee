########## feature_item ##########
okCancelEvents = @Lib.okCancelEvents
activate_input = @Lib.activate_input

Template.group_item.events
  'click': ->
    Session.set 'selected_group', @_id
  'click .destroy': ->
    Groups.remove @_id
    Session.set 'selected_group', null
  'dblclick': ->
    Session.set 'groups:editing_groups', @_id

Template.group_item.events okCancelEvents('.edit-feature-input',
  ok: (text, evt) ->
    group_id = Session.get 'groups:editing_groups'
    Groups.update group_id, $set: name: text
    Session.set 'groups:editing_groups', null
  cancel: ->
    Session.set 'groups:editing_groups', null
)

Template.group_item.helpers
  selected_class: ->
    if Session.equals('selected_group', @_id) then 'selected' else ''
  editing_group: ->
    Session.equals('groups:editing_groups', @_id)

Template.group_item.rendered = ->
  # does nothing if the input field is not in the dom
  activate_input @find('input')
  $(@findAll('.item-icon')).tooltip()
