'use strict'

angular.module 'twatterApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router'
  'firebase'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $urlRouterProvider
  .otherwise '/'

  $locationProvider.html5Mode true
