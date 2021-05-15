
"use strict";

let ReadLoad = require('./ReadLoad.js')
let TorqueServos = require('./TorqueServos.js')
let MoveServos = require('./MoveServos.js')
let OperatingMode = require('./OperatingMode.js')
let ReadCurrent = require('./ReadCurrent.js')
let ReadServos = require('./ReadServos.js')
let HoldServos = require('./HoldServos.js')
let ReadTemperature = require('./ReadTemperature.js')

module.exports = {
  ReadLoad: ReadLoad,
  TorqueServos: TorqueServos,
  MoveServos: MoveServos,
  OperatingMode: OperatingMode,
  ReadCurrent: ReadCurrent,
  ReadServos: ReadServos,
  HoldServos: HoldServos,
  ReadTemperature: ReadTemperature,
};
