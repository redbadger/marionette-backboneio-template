backboneio = require 'backbone.io'
express = require 'express'
routes = require './routes/routes'
app = module.exports = express()

VIEWS_PATH = __dirname + '/views'
PORT = process.env.PORT or 3000

# Configuration
app.configure( ->
  app.set 'views', VIEWS_PATH
  app.set 'view engine', 'jade'
  app.set 'view options', { layout: false }  # Option: pretty: true
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static "#{__dirname}/../client"
)

app.configure 'development', ->
  app.use express.errorHandler
    dumpExceptions: true
    showStack: true

app.configure 'production', ->
  app.use express.errorHandler()

# Routes
app.get '/', routes.home

server = app.listen PORT, ->
  console.log "Express server listening on port %d in %s mode", PORT, app.settings.env

backend = backboneio.createBackend()
backend.use backboneio.middleware.memoryStore()
backboneio.listen server,
  mybackend: backend
