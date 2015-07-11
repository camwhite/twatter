'use strict'

angular.module 'twatterApp'
.factory 'Api', ($http, $q) ->
  get: (route, id) ->
    deferred = $q.defer()

    if id?
      $http.get 'api/' + route + '/' + id
      .success(deferred.resolve).error(deferred.reject)
    else
      $http.get 'api/' + route
      .success(deferred.resolve).error(deferred.reject)

    deferred.promise
  post: (route, data) ->
    deferred = $q.defer()

    $http.post 'api/' + route, data
    .success(deferred.resolve).error(deferred.reject)

    deferred.promise
  put: (route, id, data) ->
    deferred = $q.defer()

    $http.put 'api/' + route + '/' + id, data
    .success(deferred.resolve).error(deferred.reject)

    deferred.promise
  delete: (route, id) ->
    deferred = $q.defer()

    $http.delete 'api/' + route + '/' + id
    .success(deferred.resolve).error(deferred.reject)

    deferred.promise

