'use strict'

angular.module 'twatterApp'
.service 'Auth', ->
  getAuth: ->
    ref = new Firebase 'https://twat.firebaseio.com/'

    authData = ref.getAuth()

    if authData?
      true

  getCurrentUser: ->
    ref = new Firebase 'https://twat.firebaseio.com/'

    authData = ref.getAuth()

    if authData?
      @user = {
        name: authData.twitter.displayName
        avatar: authData.twitter.profileImageURL
        uid: authData.uid
      }

