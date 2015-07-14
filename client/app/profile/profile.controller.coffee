'use strict'

angular.module 'twatterApp'
.controller 'ProfileCtrl', ($scope, $rootScope, $stateParams, user, Media, Auth) ->
  @user = user

  Auth.getCurrentUser().then (user) =>
    @currentUser = user

  @param = $stateParams.id

  $scope.$watch angular.bind(this, => @file), =>
    # initialize upload method with the file
    files = Media.upload @file
    # check to see if files is defined
    if files?
      # assign url from uploads returned promise
      files[0].then (file) =>
        @user.profile_image = file.config.url + file.config.file.name.split(' ').join('+')

        Auth.update @user._id, @user

        $rootScope.$emit 'profile-image:changed'

  return this
