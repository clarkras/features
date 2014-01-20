# Features -- {name: String,
#             active: Boolean,
#             project_id: String,
#             timestamp: Number}
Features = new Meteor.Collection("features")
if Meteor.isClient
  @Features = Features
else
  share.Features = Features

