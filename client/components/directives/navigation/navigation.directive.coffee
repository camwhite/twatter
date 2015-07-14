'use strict'

angular.module 'twatterApp'
.directive 'navigation', ->
  templateUrl: 'components/directives/navigation/navigation.html'
  restrict: 'E'
  controller: 'NavigationCtrl'
  controllerAs: 'controller'
  link: (scope, element, attrs) ->
