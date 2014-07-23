expect = require('chai').expect

FriendListCtrl = require 'controllers/friend_list'

describe 'FriendListCtrl', ->
  it 'gets friendNameText', ->
    name = FriendListCtrl.friendNameText {username: 'jim', lastSent: Date.now()}
    expect(name).to.equal 'Sent!'
    
    past = Date.now() - 10000
    name = FriendListCtrl.friendNameText {username: 'jim', lastSent: past}
    expect(name).to.equal 'jim'
