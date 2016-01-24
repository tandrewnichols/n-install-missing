[![Build Status](https://travis-ci.org/tandrewnichols/n-install-missing.png)](https://travis-ci.org/tandrewnichols/n-install-missing) [![downloads](http://img.shields.io/npm/dm/n-install-missing.svg)](https://npmjs.org/package/n-install-missing) [![npm](http://img.shields.io/npm/v/n-install-missing.svg)](https://npmjs.org/package/n-install-missing) [![Code Climate](https://codeclimate.com/github/tandrewnichols/n-install-missing/badges/gpa.svg)](https://codeclimate.com/github/tandrewnichols/n-install-missing) [![Test Coverage](https://codeclimate.com/github/tandrewnichols/n-install-missing/badges/coverage.svg)](https://codeclimate.com/github/tandrewnichols/n-install-missing) [![dependencies](https://david-dm.org/tandrewnichols/n-install-missing.png)](https://david-dm.org/tandrewnichols/n-install-missing)

# n-install-missing

Given a list of node versions, install any not currently installed using n.

## Installation

`npm install --save n-install-missing`

## Summary

`n-install-missing` exports a function that takes an array of node versions and, using [n](https://github.com/tj/n), installs any that aren't currently installed.

```js
var install = require('n-install-missing');
install(['4.0.0', '5.0.0'], function(err) {

});
```

By default, there is logging when installing each version, but you can turn this off by passing the `quiet` option.

```js
var install = require('n-install-missing');
install(['4.0.0', '5.0.0'], { quiet: true }, function(err) {

});
```

## Contributing

Please see [the contribution guidelines](CONTRIBUTING.md).
