'use strict'

angular.module 'twatterApp'
.directive 'logout', ->
  templateUrl: 'components/directives/logout/logout.html'
  restrict: 'E'
  controller: 'LogoutCtrl'
  controllerAs: 'controller'
  scope: {}
