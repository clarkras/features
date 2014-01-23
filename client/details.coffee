Template.details.any_feature_selected = ->
  console.log "selected_feature", Session.get("selected_feature")
  Session.get("selected_feature")

Template.details.feature = ->
  Features.findOne Session.get('selected_feature')
