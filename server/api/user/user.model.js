'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var UserSchema = new Schema({
  display_name: String,
  twitter_avatar: String,
  profile_image: String,
  uid: String
});

module.exports = mongoose.model('User', UserSchema);
