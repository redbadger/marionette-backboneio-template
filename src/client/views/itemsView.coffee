define [
  'backbone',
  'marionette',
  'views/itemView'], (Backbone, Marionette, ItemView) ->
  'use strict'

  Backbone.Marionette.CollectionView.extend
    itemView: ItemView
    tagName: 'table'
    className: 'table table-striped'
