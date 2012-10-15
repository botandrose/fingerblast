// testing deps
chai = require("chai");
chai.should();
global.sinon = require("sinon");
global.assert = sinon.assert;

// runtime deps
require("ember/runtime");
global.Fingerblast = {};
