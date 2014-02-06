define [
  'application',
  'collections/index',
  'models/index',
  'views/itemsView',
  'views/addUserView',
  'views/detailView'], (App, Collection, Model, MyCollectionView, AddUserView, MyDetailView) ->
  'use strict'

  Backbone.Marionette.Controller.extend
    initialize: ->
      @data = new Collection()
      @data.fetch()

    default: (param) ->
      myCollectionView = new MyCollectionView(collection: @data)
      addUserView = new AddUserView(collection: @data)
      App.rootRegion.show addUserView
      App.contentRegion.show myCollectionView

    details: (param) ->
      myDetailView = new MyDetailView(model: @data.get(param))
      App.rootRegion.close()
      App.contentRegion.show myDetailView

