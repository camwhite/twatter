'use strict'

angular.module 'twatterApp'
.controller 'LoginCtrl', ($rootScope, $state, $location, $firebaseArray, Auth) ->
  ref = new Firebase 'https://twat.firebaseio.com/'
  userSync = $firebaseArray ref.child 'users'

  @users = userSync

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

        @users.$add @user

        $state.go 'timeline'

   @logout = =>
     ref.unauth()
     $state.go 'login'

     @isAuth = Auth.getAuth()

  return this
