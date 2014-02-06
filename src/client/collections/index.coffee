define [
  'backbone',
  'models/index',
  'backboneio'], (Backbone, Model) ->
  'use strict'

  Backbone.Collection.extend
    model: Model
    backend: 'mybackend'
    initialize: ->
      @bindBackend()
