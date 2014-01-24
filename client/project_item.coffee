########## project_item ##########
activate_input = @Lib.activate_input
okCancelEvents = @Lib.okCancelEvents

Template.project_item.helpers
  editing_project: ->
    Session.equals('editing_project', @_id)
  creating_feature: ->
    Session.equals('creating_feature', @_id)

Template.project_item.events
  'click .tree-icon': (evt, tmpl) ->
    on_click_tree_icon tmpl
  'click .add': (evt, tmpl) ->
    Session.set 'creating_feature', tmpl.data._id
  'click .destroy': ->
    Projects.remove @_id
  'dblclick': ->
    Session.set 'editing_project', @_id

Template.project_item.events okCancelEvents('.edit-project-input',
  ok: (text, evt) ->
    project_id = Session.get 'editing_project'
    Projects.update project_id, $set: name: text
    Session.set 'editing_project', null
  cancel: ->
    Session.set 'editing_project', null
)

Template.project_item.rendered = ->
  activate_input @find('input')
  $(@findAll('.item-icon')).tooltip()

Template.project_item.events okCancelEvents('.new-feature-input',
  ok: (text, evt) ->
    project_id = Session.get 'creating_feature'
    feature_id = Features.insert(name: text, project_id: project_id, timestamp: new Date().getTime(), active: false)
    evt.target.value = ""
    Session.set 'creating_feature', false
    Session.set 'selected_feature', feature_id
  cancel: ->
    Session.set 'creating_feature', false
)

on_click_tree_icon = (tmpl) ->
  if Features.find(project_id: tmpl.data._id).count() > 0
    $("[data-js-project_id=#{tmpl.data._id}]").slideToggle(100)
    $(tmpl.findAll('.tree-icon')).toggle()

