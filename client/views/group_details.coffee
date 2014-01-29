okCancelEvents = @Lib.okCancelEvents
activate_input = @Lib.activate_input

Template.group_details.events
  'click [data-js=group-name]': ->
    Session.set 'group_details:editing_group', @_id
  'click [data-js=account-ids], click [data-js=empty-account-ids]': ->
    Session.set 'group_details:editing_account_ids', @_id

Template.group_details.helpers
  editing_group: ->
    Session.equals('group_details:editing_group', @_id)
  editing_account_ids: ->
    Session.equals('group_details:editing_account_ids', @_id)

Template.group_details.rendered = ->
  activate_input @find('[data-js=group-name-input]')
  activate_input @find('[data-js=account-ids-input]')
  $(@findAll('[title]')).tooltip()

Template.group_details.events okCancelEvents('[data-js=group-name-input]',
  ok: (text, evt) ->
    Groups.update @_id, $set: name: text
    Session.set 'group_details:editing_group', false
  cancel: ->
    Session.set 'group_details:editing_group', false
)

Template.group_details.events okCancelEvents('[data-js=account-ids-input]',
  ok: (text, evt) ->
    Groups.update @_id, $set: account_ids: text
    Session.set 'group_details:editing_account_ids', false
  cancel: ->
    Session.set 'group_details:editing_account_ids', false
)

