'use strict'

angular.module 'twatterApp'
.config ($stateProvider) ->
  $stateProvider.state 'login',
    url: '/'
    templateUrl: 'app/login/login.html'
    controller: 'LoginCtrl'
    controllerAs: 'controller'
