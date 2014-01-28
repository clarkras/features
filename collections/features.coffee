Features = new Meteor.Collection("features")
if Meteor.isClient
  @Features = Features
else
  share.Features = Features

Features.defaults = ->
  name: ''
  project_id: ''
  timestamp: new Date().getTime()
  active: false
  all_users: true
  use_percentage: false
  percentage: 0
  use_groups: false
  groups: []

if Meteor.isClient
  Handlebars.registerHelper 'features', (id) ->
    Features.find {project_id: id}, {sort: name: 1}
