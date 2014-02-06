define [
  'backbone',
  'marionette',
  'templates/details'], (Backbone, Marionette, template) ->
  'use strict'

  Backbone.Marionette.ItemView.extend
    template: template
    tagName: "p"

