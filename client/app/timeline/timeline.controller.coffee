'use strict'

angular.module 'twatterApp'
.controller 'TimelineCtrl', ($scope, $state, $firebaseArray, user) ->
  ref = new Firebase 'https://twat.firebaseio.com/'

  @user = user

  twatSync = $firebaseArray ref.child 'twats'
  @twats = twatSync

  @twat = {
      content: ''
  }

  @twatSomething = =>
    @twat.user =  @user

    @twats.$add @twat

    @twat.content = ''

  @removeTwat = (twat) =>
    if @user.uid is twat.user.uid
      @twats.$remove twat

  @viewUser = (id) =>
    $state.go 'profile', id

  @charCount = 69
  originalCount = 69

  $scope.$watch angular.bind(this, => @twat.content), (newVal, oldVal) =>
    if !newVal?
      @charCount = originalCount
    else
      @charCount = originalCount - newVal.length

  return this
