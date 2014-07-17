module.exports =
  view: ->
    [
      #z 'img', src: 'images/slap.png'
      z 'h1', 'Slap Your Friends and Enemies'
      z 'h2', 'Send friends slaps and see if they slap back!'
      z 'a.c-button-blue.uppercase[href="/slap"]',
        config: z.route,
        'slap a person!'
      z 'br'
      z 'a.c-button-purple.uppercase[href="/slap"]',
        config: z.route,
        'slap a group!'
    ]
  controller: ->
    null
