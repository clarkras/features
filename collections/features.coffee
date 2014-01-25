# Features -- name: String,
#             project_id: String,
#             timestamp: Number
#             active: Boolean,
#             all_users: Boolean
#             use_groups: Boolean
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
  use_groups: false

if Meteor.isClient
  Handlebars.registerHelper 'features', (id) ->
    Features.find {project_id: id}, {sort: name: 1}
