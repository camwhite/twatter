'use strict'

angular.module 'twatterApp'
.config ($stateProvider) ->
  $stateProvider.state 'timeline',
    url: '/timeline'
    templateUrl: 'app/timeline/timeline.html'
    controller: 'TimelineCtrl'
    controllerAs: 'controller'
    resolve:
      user: (Auth) ->
        Auth.getCurrentUser()
