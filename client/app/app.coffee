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

.run ($rootScope, $location, Auth) ->
  # Redirect to login if route requires auth and you're not logged in
  $rootScope.$on '$stateChangeStart', ->
    if !Auth.getAuth()
      $location.path "/"
