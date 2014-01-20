

# This file is no longer being used.


$dialog = null

Template.new_feature.rendered = ->
  $dialog = $('#new-feature-form')
  $dialog.dialog
    autoOpen: false
    height: 300
    width: 350
    modal: true
    buttons:
      'Create': ->
        name = $(@).find('input').val()
        console.log "create: #{name}"
        Session.set 'create_feature', name
        Session.set 'creating_feature', false
        $(@).dialog 'close'
      'Cancel': ->
        console.log 'cancel'
        Session.set 'creating_feature', false
        $(@).dialog 'close'

Deps.autorun ->
  $dialog.dialog('open') if Session.get('creating_feature') is true and $dialog

