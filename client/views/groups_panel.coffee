Template.groups_panel.helpers
  selected_group: ->
    Groups.findOne(Session.get('selected_group'))
