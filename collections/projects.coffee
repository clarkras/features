# Groups -- {name: String}
Groups = new Meteor.Collection("groups")
if Meteor.isClient
  @Groups = Groups
else
  share.Groups = Groups

if Meteor.isClient
  Handlebars.registerHelper 'projects', ->
    Projects.find {}, {sort: name: 1}
