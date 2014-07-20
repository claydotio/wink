ActorModel = require './actor'

getSavedFriends = ->
  _.filter(JSON.parse(localStorage.friends or '[]'))

saveFriends = (friends) ->
  localStorage.friends = JSON.stringify(friends)


module.exports = do =>
  @get = getSavedFriends
  @add = (users) ->
    console.log 'adding', users, 'as', ActorModel.get()
    friends = getSavedFriends()
    saveFriends(
      _.omit(
        _.uniq(
          users.concat(friends),
          'username'
        ),
        (user) -> user.username == ActorModel.get().username
      )
    )
  @updateSent = (username) =>
    if _.isArray username
      return _.map username, @updateSent


    friends = getSavedFriends()
    _.find(friends, username: username).lastSent = Date.now()
    saveFriends(friends)
  return this
