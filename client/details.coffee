Template.details.any_feature_selected = ->
  Session.get("selected_feature")

Template.details.feature = ->
  Features.findOne Session.get('selected_feature')
