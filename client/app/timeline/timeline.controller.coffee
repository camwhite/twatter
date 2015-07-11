'use strict'

angular.module 'twatterApp'
.controller 'TimelineCtrl', ($scope, $firebaseArray, Auth) ->
  ref = new Firebase 'https://twat.firebaseio.com/'

  @user = Auth.getCurrentUser()

  twatSync = $firebaseArray ref.child 'twats'
  @twats = twatSync

  @twat = {
      content: ''
  }

  @charCount = 69
  originalCount = 69

  $scope.$watch angular.bind(this, => @twat.content), (newVal, oldVal) =>
    if !newVal?
      @charCount = originalCount
    else
      @charCount = originalCount - newVal.length

  @twatSomething = =>
    @twat.user =  @user

    $scope.$emit 'twatted'

    @twats.$add @twat
    @twat.content = ''

  @removeTwat = (twat) =>
    if @user.uid is twat.user.uid
      @twats.$remove twat

  return this
