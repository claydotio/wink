z = require 'zorium'
WinkCtrl = require '../controllers/wink'

module.exports = do ->
  @wink = WinkCtrl.pickAndWink
  @render = =>
    z 'div.wink-button', onclick: @wink, 'Wink!'

  return this
