'use strict'

angular.module 'twatterApp'
.filter 'reverse', ->
  (items) ->
    items.slice().reverse()
