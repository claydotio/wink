FriendListCtrl = require '../controllers/friend_list'
styleVars = require '../../stylus/vars'
console.log kik.message
module.exports =
  render: ->
    friendBgIndex = 0
    [
      FriendListCtrl.getFriends().map (friend) ->
        colors = styleVars.friendColors
        z 'div.friend-button', (
            style:
              backgroundColor: colors[friendBgIndex++ % colors.length]
            onclick: ->
              FriendListCtrl.winkFriend friend
          ), FriendListCtrl.friendNameText friend
      z 'a.add-friend-button',
        onclick: FriendListCtrl.addFriends,
        '+ Add Friend'
    ]
