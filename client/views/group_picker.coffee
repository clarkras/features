Template.group_picker.helpers
  group_checked: (options) ->
    feature = options.hash.feature
    checked = _.contains feature.groups, @_id
    if checked then 'checked' else ''

Template.group_picker.events
  'click [data-js=use_groups_checkbox]': (evt) ->
    checked = evt.currentTarget.checked
    Features.update(@_id, $set: use_groups: checked)
  'click [data-js=group_checkbox]': (evt, tmpl) ->
    on_click_group(@_id, evt.currentTarget.checked, tmpl.data)

on_click_group = (group_id, checked, feature) ->
  groups = feature.groups or []
  if checked
    groups.push group_id
  else
    groups = _.reject groups, (id) ->
      id is group_id
  Features.update(feature._id, $set: groups: groups)

