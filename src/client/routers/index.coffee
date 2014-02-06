define [
  'backbone',
  'marionette',
  'controllers/default'], (Backbone, Marionette, DefaultController) ->
  'use strict'

  Backbone.Marionette.AppRouter.extend
    appRoutes:
      ":name": "details"
      "*action": "default"
    controller: new DefaultController()
