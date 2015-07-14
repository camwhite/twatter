'use strict'

describe 'Directive: navigation', ->

  # load the directive's module and view
  beforeEach module 'twatterBackendApp'
  beforeEach module 'components/directives/navigation/navigation.html'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<navigation></navigation>'
    element = $compile(element) scope
    scope.$apply()
    expect(element.text()).toBe 'this is the navigation directive'

