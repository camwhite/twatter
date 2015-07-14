'use strict'

angular.module 'twatterApp'
.controller 'NavigationCtrl', ($rootScope, Auth) ->
  $rootScope.isAuth = Auth.getAuth()

  Auth.getCurrentUser().then (user) =>
    @user = user

  $rootScope.$on 'profile-image:changed', =>
    Auth.getCurrentUser().then (user) =>
      @user = user

  return this
