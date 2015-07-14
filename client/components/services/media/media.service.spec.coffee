'use strict'

describe 'Service: media', ->

  # load the service's module
  beforeEach module 'twatterBackendApp'

  # instantiate service
  media = undefined
  beforeEach inject (_media_) ->
    media = _media_

  it 'should do something', ->
    expect(!!media).toBe true
