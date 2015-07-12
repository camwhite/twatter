'use strict'

angular.module 'twatterApp'
.config ($stateProvider) ->
  $stateProvider.state 'profile',
    url: '/profile/:id'
    templateUrl: 'app/profile/profile.html'
    controller: 'ProfileCtrl'
    controllerAs: 'controller'
    resolve:
      user: ($stateParams, Auth) ->
        Auth.query $stateParams.id
