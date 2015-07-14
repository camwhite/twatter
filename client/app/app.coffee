'use strict'

angular.module 'twatterApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router'
  'firebase'
  'ngFileUpload'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $urlRouterProvider
  .otherwise '/'

  $locationProvider.html5Mode true

.run ($rootScope, $location, Auth) ->
  auth = Auth.getAuth()
  # Redirect to login if route requires auth and you're not logged in
  $rootScope.$on '$stateChangeStart', ->
    if !auth
      $location.path '/'
