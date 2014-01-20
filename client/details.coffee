Template.details.any_feature_selected = ->
  not Session.equals("selected_feature", null)

Template.details.feature = ->
  Features.findOne Session.get('selected_feature')
