var n = require('n-wrap');
var installed = require('n-installed');
var _ = require('lodash');
var isIo = require('is-io-version');
var async = require('async');
var chalk = require('chalk');

module.exports = function(versions, options, cb) {
  if (typeof options === 'function') {
    cb = options;
    options = {};
  }

  var log = options.quiet ? function() {} : console.log;

  installed(function(err, actual) {
    if (err) {
      return cb(err);
    }
    var install = _.difference(versions, actual);
    async.each(install, function(version, next) {
      var io = isIo(version);
      log('Installing', io ? 'io' : 'node', 'version', chalk.cyan(version));
      return io ? n.io(version, { download: true }, next) : n(version, { download: true }, next);
    }, cb);
  });
};
