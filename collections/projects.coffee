# Projects -- {name: String}
Projects = new Meteor.Collection("projects")
if Meteor.isClient
  @Projects = Projects
else
  share.Projects = Projects
