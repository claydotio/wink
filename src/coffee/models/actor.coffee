Q = require 'q'
z = require 'zorium'

class ActorModel
  @user = null

  get: ->
    @user
  login: ->
    deferred = Q.defer()
    Clay.ready =>
      Clay.Kik.connect (response) =>
        if not response.success
          return deferred.reject 'Permission Denied'
        @user = Clay.Player.data
        deferred.resolve(user)
    deferred.promise

module.exports = new ActorModel()
