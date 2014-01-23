########## new_project ##########
activate_input = @Lib.activate_input
okCancelEvents = @Lib.okCancelEvents

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

