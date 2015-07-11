'use strict'

angular.module 'twatterApp'
.controller 'LoginCtrl', ($rootScope, $state, $location, $firebaseArray, Auth) ->
  ref = new Firebase 'https://twat.firebaseio.com/'

  @login = =>
    ref.authWithOAuthPopup 'twitter', (error, authData) =>
      if error
        console.log "Login Failed!", error
      else
        $rootScope.isAuth = authData?

        @user = {
          name: authData.twitter.displayName
          avatar: authData.twitter.profileImageURL
          uid: authData.uid
        }

        $state.go 'timeline'

  return this
