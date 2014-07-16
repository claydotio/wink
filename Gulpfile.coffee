gulp = require 'gulp'
gutil = require 'gulp-util'
concat = require 'gulp-concat'
nodemon = require 'gulp-nodemon'
#uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
browserify = require 'browserify'
clean = require 'gulp-clean'
sourcemaps = require 'gulp-sourcemaps'
source = require 'vinyl-source-stream'
runSequence = require 'gulp-run-sequence'
stylus = require 'gulp-stylus'
coffeelint = require 'gulp-coffeelint'

outFiles =
  dev:
    scripts: 'bundle.js'
    styles: 'bundle.css'
    vendors: 'vendor.js'
  prod:
    scripts: 'bundle.min.js'
    styles: 'bundle.min.css'
    vendors: 'vendor.min.js'

paths =
  scripts: './src/coffee/**/*.coffee'
  root: './src/coffee/root.coffee'
  vendor: './src/vendor/*.js'
  index: './src/index.html'
  styles: './src/stylus/style.styl'
  dist: './dist/'
  build: './build/'

# start the dev server, and auto-update
gulp.task 'default', ['server', 'dev', 'watch']

# compile sources: src/* -> build/*
gulp.task 'dev', ['vendor:dev', 'scripts:dev', 'styles:dev', 'index:dev']

# compile sources: src/* -> dist/*
gulp.task  'prod', ['vendor:prod', 'scripts:prod', 'styles:prod', 'index:prod']

# build for production
gulp.task 'build', (cb) ->
  runSequence 'clean:dist', 'prod', cb

#
# Dev server and watcher
#

# start the dev server
gulp.task 'server', ->

  # Don't actually watch for changes, just run the server
  nodemon script: 'server.js', ext: 'null'


gulp.task 'watch', ->
  gulp.watch paths.scripts, ['scripts:dev']
  gulp.watch paths.vendor, ['vendor:dev']
  gulp.watch paths.styles, ['styles:dev']

# run coffee-lint
gulp.task 'lint:scripts', ->
  gulp.src paths.scripts
    .pipe coffeelint()
    .pipe coffeelint.reporter()

#
# Dev compilation
#

errorHandler = ->
  gutil.log.apply null, arguments
  @emit 'end'

# init.coffee --> build/js/bundle.js
gulp.task 'scripts:dev', ['lint:scripts'], ->
  browserify
    entries: paths.root
    extensions: ['.coffee']
  .bundle debug: true
  .on('error', errorHandler)
  .pipe source outFiles.dev.scripts
  .pipe gulp.dest paths.build + '/js/'

# vendor/*.js --> build/js/vendor.js
gulp.task 'vendor:dev', ->
  gulp.src paths.vendor
    .pipe sourcemaps.init()
      .pipe concat outFiles.dev.vendors
    .pipe sourcemaps.write()
    .pipe gulp.dest paths.build + '/js/'

# css/style.css --> build/css/bundle.css
gulp.task 'styles:dev', ->
  gulp.src paths.styles
    .pipe sourcemaps.init()
      .pipe stylus()
      .pipe rename outFiles.dev.styles
    .pipe sourcemaps.write()
    .pipe gulp.dest paths.build + '/css/'

# index.html --> build/index.html
gulp.task 'index:dev', ->
  gulp.src paths.index
    .pipe gulp.dest paths.build

#
# Production compilation
#

# rm -r dist
gulp.task 'clean:dist', ->
  gulp.src paths.dist, read: false
    .pipe clean()

# init.coffee --> dist/js/bundle.min.js
gulp.task 'scripts:prod', ['lint:scripts'], ->
  browserify
    entries:  paths.root
    extentions: '.coffee'
  .plugin 'minifyify',
    map: 'maps/' + outFiles.prod.scripts + '.map'
    compressPath: ''
    output: paths.dist + 'maps/' + outFiles.prod.scripts + '.map'
  .bundle()
  .pipe source outFiles.prod.scripts
  .pipe gulp.dest paths.dist + '/js/'

# vendor/*.js --> dist/js/vendor.min.js
gulp.task 'vendor:prod', ->
  gulp.src paths.vendor
    .pipe sourcemaps.init()
      .pipe concat outFiles.prod.vendors
    .pipe sourcemaps.write '../maps/'
    .pipe gulp.dest paths.dist + '/js/'

# css/style.css --> dist/css/bundle.min.css
gulp.task 'styles:prod', ->
  gulp.src paths.styles
    .pipe sourcemaps.init()
      .pipe stylus()
      .pipe rename outFiles.prod.styles
    .pipe sourcemaps.write '../maps/'
    .pipe gulp.dest paths.dist + '/css/'

# index.html --> dist/index.html
gulp.task 'index:prod', ->
  gulp.src paths.index
    .pipe gulp.dest paths.dist
