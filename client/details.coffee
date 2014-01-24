
Template.details.events
  'click .active-icon': ->
    Features.update @_id, $set: active: not @active

Template.details.helpers
  any_feature_selected: ->
    Session.get("selected_feature")
  feature: ->
    Features.findOne Session.get('selected_feature')
  active_class: ->
    if @active then "label-success" else "label-default"
  active_text: ->
    if @active then "On" else "Off"
