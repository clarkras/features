Template.group_picker.helpers
  group_checked:  ->
    if @name is 'Development' then 'checked' else ''

Template.group_picker.events
  'click input[type=checkbox]': (evt) ->
    checked = evt.currentTarget.checked
    Features.update(@_id, $set: use_groups: checked)
