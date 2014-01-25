
Template.details.events
  'click .active-icon': ->
    Features.update @_id, $set: active: not @active
  'click input[name=scope]': (evt) ->
    all_users = evt.currentTarget.value is 'all'
    Features.update(@_id, $set: all_users: all_users)

Template.details.helpers
  any_feature_selected: ->
    Session.get("selected_feature")
  feature: ->
    Features.findOne Session.get('selected_feature')
  active_class: ->
    if @active then "label-success" else "label-default"
  active_text: ->
    if @active then "On" else "Off"
  custom_settings: ->
    'disabled' if @all_users
  all_users_checked: (scope) ->
    if @all_users and scope is 'all' or
        not @all_users and scope is 'custom'
      'checked'
    else
      ''
