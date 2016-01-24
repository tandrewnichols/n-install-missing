sinon = require 'sinon'
async = require 'async'
chalk = require 'chalk'

describe 'n-install-missing', ->
  Given -> @n = sinon.stub()
  Given -> @n.io = sinon.stub()
  Given -> @installed = sinon.stub()
  Given -> @subject = require('proxyquire').noCallThru() '../lib/n-install-missing',
    'n-wrap': @n
    'n-installed': @installed

  # Make async work synchronously by having it's setImmediate, call the defered function immediately
  afterEach -> async.setImmediate.restore()
  Given -> sinon.stub async, 'setImmediate'
  Given -> async.setImmediate.callsArg 0

  # Stub console.log to check that the right things get logged (or that no logs occur in quiet mode)
  afterEach -> console.log.restore()
  Given -> sinon.stub console, 'log'

  describe 'no options', ->
    Given -> @installed.callsArgWith 0, null, ['0.12.9']
    Given -> @n.withArgs('0.10.3', download: true, sinon.match.func).callsArgWith 2, null
    Given -> @n.io.withArgs('1.2.3', download: true, sinon.match.func).callsArgWith 2, null
    Given -> @cb = sinon.stub()
    When -> @subject ['0.10.3', '0.12.9', '1.2.3'], @cb
    Then ->
      @cb.calledWith(null).should.be.true()
      console.log.calledWith('Installing', 'node', 'version', chalk.cyan('0.10.3')).should.be.true()
      console.log.calledWith('Installing', 'io', 'version', chalk.cyan('1.2.3')).should.be.true()

  describe 'options', ->
    Given -> @installed.callsArgWith 0, null, ['0.12.9']
    Given -> @n.withArgs('0.10.3', download: true, sinon.match.func).callsArgWith 2, null
    Given -> @n.io.withArgs('1.2.3', download: true, sinon.match.func).callsArgWith 2, null
    Given -> @cb = sinon.stub()
    When -> @subject ['0.10.3', '0.12.9', '1.2.3'], { quiet: true }, @cb
    Then ->
      @cb.calledWith(null).should.be.true()
      console.log.called.should.be.false()

  describe 'an error', ->
    Given -> @installed.callsArgWith 0, 'err'
    Given -> @cb = sinon.stub()
    When -> @subject ['0.10.3', '0.12.9', '1.2.3'], { quiet: true }, @cb
    Then ->
      @cb.calledWith('err').should.be.true()
