var gulp = require('gulp');
var jade = require('gulp-jade');
var coffee = require('gulp-coffee');
var uglify = require('gulp-uglify');
var less = require('gulp-less');
var imagemin = require('gulp-imagemin');
var wrap = require('gulp-wrap-amd');
var nodemon = require('gulp-nodemon');
var bower = require('gulp-bower');

var DIST_DIR = './dist'

gulp.task('coffee', function () {
  gulp.src('./src/**/*.coffee')
    .pipe(coffee())
    .pipe(uglify())
    .pipe(gulp.dest(DIST_DIR));
});

gulp.task('less', function () {
  gulp.src('./src/client/assets/css/styles.less')
    .pipe(less())
    .pipe(gulp.dest(DIST_DIR + '/client/assets/css'));
});

gulp.task('fonts', function () {
  gulp.src('./src/client/assets/fonts/**/*')
    .pipe(gulp.dest(DIST_DIR + '/client/assets/fonts'));
});

gulp.task('images', function () {
  gulp.src('./src/client/assets/img/**/*')
    .pipe(imagemin({ optimizationLevel: 5 }))
    .pipe(gulp.dest(DIST_DIR + '/client/assets/img'));
});

gulp.task('client_templates', function () {
  gulp.src('./src/client/**/*.jade')
    .pipe(jade({ client: true }))
    .pipe(uglify())
    .pipe(wrap({
       deps: ['jade'],
       params: ['jade']
     }))
    .pipe(gulp.dest(DIST_DIR + '/client'));
});

gulp.task('server_views', function () {
  gulp.src('./src/server/views/**/*').pipe(gulp.dest(DIST_DIR + '/server/views'));
});

gulp.task('bower', function() {
  bower()
});

gulp.task('develop', function () {
  nodemon({
    script: DIST_DIR + '/server/app.js',
    ext: 'jade coffee less'
  }).on('restart', ['coffee', 'less', 'client_templates', 'server_views', 'images', 'fonts'])
})

gulp.task('default', ['coffee', 'less', 'images', 'fonts', 'client_templates', 'server_views', 'images', 'bower']);
