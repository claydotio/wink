HomePage = require './pages/home'
SlapPage = require './pages/slap'

kik.getUser (user) ->
  console.log user

z.route.mode = 'hash'
z.route document.getElementById('app'), '/',
  '/': HomePage
  '/slap': SlapPage
