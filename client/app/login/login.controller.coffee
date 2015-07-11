'use strict'

angular.module 'twatterApp'
.controller 'LoginCtrl', ($rootScope, $state, $firebaseArray, Auth) ->
  ref = new Firebase 'https://twat.firebaseio.com/'

  @login = =>
    ref.authWithOAuthPopup 'twitter', (error, authData) =>
      if error
        console.log "Login Failed!", error
      else
        $rootScope.isAuth = authData?

        $state.go 'timeline'

  return this
