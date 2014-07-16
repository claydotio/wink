module.exports =
  view: ->
    [
      z 'img', src: 'images/slap.png'
      z 'h1', 'Slap Your Friends and Enemies'
      z 'button.c-button-blue.uppercase', 'slap a person!'
      z 'button.c-button-purple.uppercase', 'slap a group!'
    ]
  controller: ->
    null
