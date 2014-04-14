Meteor.methods

  # Cleans up orphaned features when a project is deleted.
  # Called by the client when a project is deleted.
  project_deleted: (id) ->
    share.Features.remove {project_id: id}
    {}
