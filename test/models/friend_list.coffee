expect = require('chai').expect

FriendListModel = require 'models/friend_list'

describe 'FriendListModel', ->
  beforeEach FriendListModel.clear

  it 'add()', ->
    FriendListModel.add [{username: 'jim'}, {username: 'bob'}]

  it 'get()', ->
    FriendListModel.add [{username: 'jim'}, {username: 'bob'}]
    friends = FriendListModel.get()
    expect(friends.length).to.equal 2
    expect(friends[0].username).to.equal 'jim'

  it 'updateSent()', ->
    FriendListModel.add [{username: 'jim'}]
    expect(FriendListModel.get()[0].lastSent).to.equal undefined
    
    FriendListModel.updateSent ['jim']
    expect(FriendListModel.get()[0].lastSent).to.be.at.most Date.now()
