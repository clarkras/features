Template.group_picker.helpers
  groups: ->
    Groups.find({}, sort: name: 1)
  use_groups_checked: ->
    if @use_groups then 'checked' else ''
  group_checked: ->
    if @name is 'Development' then 'checked' else ''
  groups_box_class: () ->
    if @use_groups then '' else 'hidden'

Template.group_picker.events
  'click input[type=checkbox]': (evt) ->
    checked = evt.currentTarget.checked
    Features.update(@_id, $set: use_groups: checked)
