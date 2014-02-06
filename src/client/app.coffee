define [
  'application',
  'backbone',
  'routers/index',
  'backboneio'], (App, Backbone, Router) ->
  'use strict'

  Backbone.io.connect()

  App.addRegions
    rootRegion: '#root'
    contentRegion: '#content'

  App.addInitializer ->
    router = new Router()
    Backbone.history.start()
