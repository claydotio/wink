HomePage = require './pages/home'
SlapPage = require './pages/slap'

z.route.mode = 'hash'
z.route document.getElementById('app'), '/',
  '/': HomePage
  '/slap': SlapPage
