z = require 'zorium'
FriendListView = require '../views/friend_list'
WinkActionView = require '../views/wink_action'

module.exports =
  view: ->
    z 'div.c-text-center', [
      WinkActionView.render()
      FriendListView.render()
    ]
  controller: ->
    null
