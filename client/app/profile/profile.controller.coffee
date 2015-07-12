'use strict'

angular.module 'twatterApp'
.controller 'ProfileCtrl', (user) ->
  @user = user

  return this
