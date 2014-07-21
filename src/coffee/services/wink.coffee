_ = require 'lodash'
WINK_IMG_URI = 'http://i.imgur.com/dfJ3kOu.png'

module.exports = do =>
  @wink = (from, users) ->
    users = if _.isArray(users) then users else [users]
    console.log 'Winking at', _.pluck(users, 'username')
    _.map users, (user) ->
      kik.send user.username,
        title: 'Wink!'
        text: 'Wink!'
        pic: WINK_IMG_URI
        big: true
        data:
          from:
            username: from.username

  return this
