okCancelEvents = @Lib.okCancelEvents
activate_input = @Lib.activate_input

Template.details.events
  'click .active-icon': ->
    Features.update @_id, $set: active: not @active
  'click input[name=scope]': (evt) ->
    all_users = evt.currentTarget.value is 'all'
    Features.update(@_id, $set: all_users: all_users)
  'click [data-js=details-feature-name]': ->
    Session.set 'details:editing_feature', @_id
  'click [data-js=details-description], click [data-js=edit-description-icon], click [data-js=empty-description]': ->
    Session.set 'details:editing_description', @_id

Template.details.helpers
  any_feature_selected: ->
    Session.get("selected_feature")
  feature: ->
    Features.findOne Session.get('selected_feature')
  editing_feature: ->
    Session.equals('details:editing_feature', @_id)
  editing_description: ->
    Session.equals('details:editing_description', @_id)

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

Template.details.rendered = ->
  activate_input @find('[data-js=details-feature-name-input]')
  activate_input @find('[data-js=details-description-input]')

Template.details.events okCancelEvents('[data-js=details-feature-name-input]',
  ok: (text, evt) ->
    Features.update @_id, $set: name: text
    Session.set 'details:editing_feature', false
  cancel: ->
    Session.set 'details:editing_feature', false
)

Template.details.events okCancelEvents('[data-js=details-description-input]',
  ok: (text, evt) ->
    Features.update @_id, $set: description: text
    Session.set 'details:editing_description', false
  cancel: ->
    Session.set 'details:editing_description', false
)
