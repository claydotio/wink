HomePage = require './pages/home'

SlapPage =
  view: ->
    z 'div', 'test'
  controller: ->
    null

z.route.mode = 'hash'
z.route document.getElementById('app'), '/',
  '/': HomePage
  '/slap': SlapPage
