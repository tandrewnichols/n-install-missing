var gulp = require('gulp');
var codeclimate = require('gulp-codeclimate-reporter');

gulp.task('codeclimate', function() {
  if (process.version.indexOf('v4') > -1) {
    gulp.src('coverage/lcov.info', { read: false })
      .pipe(codeclimate({
        token: 'fba3ac1a81786097d1b94765739a092631287a9fa68a2efa1886135b2da2d9b1'
      }));
  }
});

