'use strict'

describe 'Controller: TimelineCtrl', ->

  # load the controller's module
  beforeEach module 'twatterApp'
  TimelineCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TimelineCtrl = $controller 'TimelineCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
