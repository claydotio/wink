z = require 'zorium'
HomePage = require './pages/home'
ActorModel = require './models/actor'
FriendListModel = require './models/friend_list'

if not ActorModel.get()

  # Require user to log in
  ActorModel.login().then null, ActorModel.login

if kik.message
  FriendListModel.add [kik.message.from]

z.route.mode = 'hash'
z.route document.getElementById('app'), '/',
  '/': HomePage

# Save push token
socket = io.connect('http://clay.io:843')
kik.push.getToken (token) ->
  socket.emit 'kik',
    method: 'storeAnonymousToken'
    data:
      token: token
