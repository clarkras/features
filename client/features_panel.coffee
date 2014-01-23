Session.set 'editing_feature', null
Session.set 'editing_project', null

# Add this to the README
# Session variables
#   creating_project    boolean
#   creating_feature    project_id
#   selected_feature    feature_id
#   editing_feature     feature_id
#   editing_project     feature_id


########## features ##########

Template.features_panel.helpers
  projects: ->
    Projects.find({}, sort: name: 1)
  features: (id) ->
    Features.find({project_id: id}, sort: name: 1)


