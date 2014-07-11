'use strict';

// Static assets
var express = require('express')
var app = express()

if (process.NODE_ENV === 'production') {
  app.use(express['static'](__dirname + '/dist'))
} else {
  app.use(express['static'](__dirname + '/build'))
}


app.listen(process.env.PORT || 3000)
console.log('Listening on port', process.env.PORT || 3000)


// fb-flo - for live reload
var flo = require('fb-flo'),
    fs = require('fs')

flo(
  'build',
  {
    port: 8888,
    host: 'localhost',
    verbose: false,
    glob: [
      'build/vendor.js',
      'build/bundle.js',
      'build/bundle.css'
    ]
  },
  function resolver(filepath, callback) {
    callback({
      resourceURL: filepath,
      contents: fs.readFileSync('build/' + filepath).toString()
    });
  }
)
