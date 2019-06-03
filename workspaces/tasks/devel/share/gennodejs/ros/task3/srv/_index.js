
"use strict";

let ColourClassificationSrv = require('./ColourClassificationSrv.js')
let DigitDetector = require('./DigitDetector.js')
let Checkpoint_res = require('./Checkpoint_res.js')
let TerminalApproach = require('./TerminalApproach.js')
let CylinderLocator = require('./CylinderLocator.js')
let CheckpointProcessor = require('./CheckpointProcessor.js')
let ValidRegionsMap = require('./ValidRegionsMap.js')
let FeatureBuilder = require('./FeatureBuilder.js')
let EllipseLocator = require('./EllipseLocator.js')
let RingApproachPoint = require('./RingApproachPoint.js')
let QRDetector = require('./QRDetector.js')

module.exports = {
  ColourClassificationSrv: ColourClassificationSrv,
  DigitDetector: DigitDetector,
  Checkpoint_res: Checkpoint_res,
  TerminalApproach: TerminalApproach,
  CylinderLocator: CylinderLocator,
  CheckpointProcessor: CheckpointProcessor,
  ValidRegionsMap: ValidRegionsMap,
  FeatureBuilder: FeatureBuilder,
  EllipseLocator: EllipseLocator,
  RingApproachPoint: RingApproachPoint,
  QRDetector: QRDetector,
};
