##  Marionette Backbone IO Template

### Overview
A real-time single page application template to get up and runing quickly.  The basic premise of this project is to allow rapid porotyping of single page real-time applications.

### Features
* Gulp build process
* Compiled Jade templates
* BackboneIO for real-time updates via SocketIO
* Coffeescript as default for development
* Less stylesheets with bootstrap included
* AMD
* Bower for client side dependencies

### Usage
1. Clone the repo `git clone git@github.com:redbadger/marionette-backboneio-template.git`
2. Install global dependencies `sudo ./installs.sh`
3. Build initial site using `gulp`
4. Use `gulp develop` from then on to start nodemon and automatic re-build / restarts when developing.  All development should be done within the `src` folder.
5. Browse to `http://localhost:3000/`
