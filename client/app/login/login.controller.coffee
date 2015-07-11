'use strict'

angular.module 'twatterApp'
.controller 'LoginCtrl', ($rootScope, $state, $firebaseArray, Auth) ->
  ref = new Firebase 'https://twat.firebaseio.com/'

  @auth = Auth.getAuth()
  @greeting = 'Login with twitter'

  if @auth
    @greeting = 'You are logged in'

  @login = =>
    ref.authWithOAuthPopup 'twitter', (error, authData) =>
      if error
        console.log "Login Failed!", error
      else
        $rootScope.isAuth = authData?

        user =
          display_name: authData.twitter.displayName
          twitter_avatar: authData.twitter.profileImageURL
          profile_image: 'https://s3.amazonaws.com/twatter/default-avatar.png'
          uid: authData.uid

        Auth.save user

        $state.go 'timeline'

  return this
