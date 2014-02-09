define [
  'backbone'
  'marionette'
  'models/index'
  'templates/addUser'], (Backbone, Marionette, MyModel, template) ->
  'use strict'

  Backbone.Marionette.ItemView.extend
    template: template
    className: 'form-inline'
    attributes:
      role: 'form'
    events:
      'click #submit' : 'addNewModel'

    addNewModel: (e) ->
      e.preventDefault()
      first_name = $('#first_name').val()
      last_name = $('#last_name').val()
      email = $('#email').val()
      detail = $('#detail').val()

      if first_name isnt '' and last_name isnt '' and email isnt '' and detail isnt ''
        @collection.create
          firstName: first_name
          lastName: last_name
          email: email
          details: detail
        , wait: true
        @resetValue()

    resetValue: ->
      $('#first_name, #last_name, #email, #detail').val ''
