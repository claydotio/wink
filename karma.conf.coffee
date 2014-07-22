# Karma configuration
# Generated on Tue Jul 22 2014 12:47:34 GMT-0700 (PDT)

defaults = require './karma.conf'

module.exports = (config) ->
  config.set defaults
  config.set

    # level of logging
    # possible values:
    # - config.LOG_DISABLE
    # - config.LOG_ERROR
    # - config.LOG_WARN
    # - config.LOG_INFO
    # - config.LOG_DEBUG
    logLevel: config.LOG_INFO
