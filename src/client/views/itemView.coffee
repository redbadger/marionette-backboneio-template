define [
  'backbone',
  'marionette',
  'templates/main'], (Backbone, Marionette, template) ->
  'use strict'

  Backbone.Marionette.ItemView.extend
    template: template
    tagName: 'tr'
    events:
      'click #delete': 'deleteItem'
    deleteItem: (evt) ->
      evt.preventDefault()
      @model.destroy()

