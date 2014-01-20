activate_input = @Lib.activate_input
okCancelEvents = @Lib.okCancelEvents

# Add this to the README
# Session variables
#   creating_project    boolean
#   creating_feature    project_id
#   selected_feature    feature_id

########## features ##########

Template.features.helpers
  projects: ->
    Projects.find({}, sort: name: 1)
  features: (id) ->
    Features.find({project_id: id}, sort: name: 1)

########## new_project ##########

Template.new_project.rendered = ->
  activate_input(@find('#new-project'))

Template.new_project.helpers
  creating_project: ->
    Session.get 'creating_project'

Template.new_project.events
  'click .new-project-link': (evt, tmpl) ->
    evt.preventDefault()
    # setting creating_project causes the template to render, exposing
    # the #new-project element.
    Session.set 'creating_project', true
    Session.set 'selected_feature', null

Template.new_project.events okCancelEvents('#new-project',
  ok: (text, evt) ->
    Projects.insert(name: text, timestamp: new Date().getTime())
    evt.target.value = ""
    Session.set 'creating_project', false
  cancel: ->
    Session.set 'creating_project', false
)

########## new_feature ##########

Template.new_feature_input.rendered = ->
  # does nothing if the input field is not in the dom
  activate_input @find('input')

Template.new_feature_input.helpers
  creating_feature: ->
    Session.get('creating_feature') is @_id

Template.new_feature_input.events okCancelEvents('.new-feature-input',
  ok: (text, evt) ->
    project_id = Session.get 'creating_feature'
    feature_id = Features.insert(name: text, project_id: project_id, timestamp: new Date().getTime(), active: false)
    evt.target.value = ""
    Session.set 'creating_feature', false
    Session.set 'selected_feature', feature_id
  cancel: ->
    Session.set 'creating_feature', false
)

########## project ##########

Template.project_item.events
  'click .add': (evt, tmpl) ->
    Session.set 'creating_feature', tmpl.data._id
  'click .destroy': ->
    Projects.remove @_id

########## feature_item ##########

Template.feature_item.events
  'click': ->
    Session.set 'selected_feature', @_id
  'click .active-icon': ->
    Features.update @_id, $set: active: not @active
    Projects.update @project_id, $set: timestamp: new Date().getTime()
  'click .destroy': ->
    Features.remove @_id

Template.feature_item.helpers
  selected_class: ->
    if Session.equals('selected_feature', @_id) then 'selected' else ''
  active_class: ->
    if @active then "label-success" else "label-default"
  active_text: ->
    if @active then "On" else "Off"

