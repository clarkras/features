########## feature_item ##########
okCancelEvents = @Lib.okCancelEvents
activate_input = @Lib.activate_input

Template.feature_item.events
  'click': ->
    Session.set 'selected_feature', @_id
  'click .active-icon': ->
    Features.update @_id, $set: active: not @active
  'click .destroy': ->
    Features.remove @_id
    Session.set 'selected_feature', null
  'dblclick': ->
    Session.set 'editing_feature', @_id

Template.feature_item.events okCancelEvents('.edit-feature-input',
  ok: (text, evt) ->
    feature_id = Session.get 'editing_feature'
    Features.update feature_id, $set: name: text
    Session.set 'editing_feature', null
  cancel: ->
    Session.set 'editing_feature', null
)

Template.feature_item.helpers
  selected_class: ->
    if Session.equals('selected_feature', @_id) then 'selected' else ''
  active_class: ->
    if @active then "label-success" else "label-default"
  active_text: ->
    if @active then "On" else "Off"
  editing_feature: ->
    Session.get('editing_feature') is @_id

Template.feature_item.rendered = ->
  # does nothing if the input field is not in the dom
  activate_input @find('input')
  $(@findAll('.item-icon')).tooltip()
