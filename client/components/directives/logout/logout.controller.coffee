'use strict'

angular.module 'twatterApp'
.controller 'LogoutCtrl', ($rootScope, $state, Auth) ->
  ref = new Firebase 'https://twat.firebaseio.com/'
  $rootScope.isAuth = Auth.getAuth()

  @logout = ->
     ref.unauth()
     $state.go 'login'

     $rootScope.isAuth = Auth.getAuth()

  return this
