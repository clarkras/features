# if the database is empty on server start, create some sample data.
Meteor.startup ->
  Projects = share.Projects
  Groups = share.Groups
  Features = share.Features
  if Projects.find().count() is 0
    data = [
      {
        name: "Social Campaigns"
        features: [
          ["Email Reporting", false]
          ["Social Promote (Facebook)", false]
          ["Social Promote (Twitter)", true]
        ]
      }
      {
        name: "SCRUI"
        features: [
          ["Feature A1", false]
          ["Feature A2", true]
        ]
      }
    ]

    timestamp = (new Date()).getTime()
    for project in data
      console.log "project: #{project.name}"
      project_id = Projects.insert
        name: project.name
        timestamp: timestamp
      for info in project.features
        Features.insert _.defaults {
          project_id: project_id
          name: info[0]
          timestamp: timestamp
          active: info[1]
        }, Features.defaults()
        timestamp += 1 # ensure unique timestamp

  if Groups.find().count() is 0
    Groups.insert(name: name) for name in ['SC-Development', 'SC-Product Marketing']

  null

