'use strict'

angular.module 'twatterApp'
.factory 'Auth', (Api) ->
  # Get user authentication state
  getAuth: ->
    ref = new Firebase 'https://twat.firebaseio.com/'
    # Get firebase auth object
    authData = ref.getAuth()
    # If authData exists return true
    if authData?
      true
  # Get current user
  getCurrentUser: ->
    ref = new Firebase 'https://twat.firebaseio.com/'
    # Get firebase auth object
    authData = ref.getAuth()
    # If authData exists return user
    if authData?
      return Api.get 'users', authData.uid
  # Create user in the db
  query: (id) ->
    if id?
      Api.get 'users', id
    else
      Api.get 'users'
  save: (user) ->
    Api.post 'users', user
  update: (id, user) ->
    Api.put 'users', id, user
