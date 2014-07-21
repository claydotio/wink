z = require 'zorium'
WinkCtrl = require '../controllers/wink'

module.exports =
  wink: WinkCtrl.pickAndWink
  render: ->
    z 'div.wink-button', onclick: @wink, 'Wink!'
