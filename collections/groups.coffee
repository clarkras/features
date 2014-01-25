# Projects -- {name: String}
Projects = new Meteor.Collection("projects")
if Meteor.isClient
  @Projects = Projects
else
  share.Projects = Projects

if Meteor.isClient
  Handlebars.registerHelper 'groups', ->
    Groups.find {}, {sort: name: 1}
