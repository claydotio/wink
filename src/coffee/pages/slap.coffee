module.exports =
  view: ->
    [
      z 'h1', 'type:'
      z 'select', [
        z 'option', value: 'slap', 'Slap Slap!'
        z 'option', value: 'bitch', 'B*tch Slap!'
        z 'option', value: 'super', 'Super Slap!'
        z 'option', value: 'happy', 'Happy Slap!'
        z 'option', value: 'love', 'Love Slap!'
        z 'option', value: 'pimp', 'Pimp Slap!'
        z 'option', value: 'angry', 'Angry Slap!'
        z 'option', value: 'silly', 'Silly Slap!'
      ]
      z 'h2', 'Include a message'
      z 'textarea', placeholder: 'optional...'
      z 'a.c-button-blue.uppercase', 'send slap'
      z 'a[href="/"]', config: z.route, 'close'
    ]
  controller: ->
    null
