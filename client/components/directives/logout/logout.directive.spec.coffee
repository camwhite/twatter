'use strict'

describe 'Directive: logout', ->

  # load the directive's module and view
  beforeEach module 'twatterApp'
  beforeEach module 'components/directives/logout/logout.html'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<logout></logout>'
    element = $compile(element) scope
    scope.$apply()
    expect(element.text()).toBe 'this is the logout directive'

