
"use strict";

let ValidRegionsMap = require('./ValidRegionsMap.js')
let TerminalApproach = require('./TerminalApproach.js')
let EllipseLocator = require('./EllipseLocator.js')
let FeatureBuilder = require('./FeatureBuilder.js')
let CheckpointProcessor = require('./CheckpointProcessor.js')
let RingApproachPoint = require('./RingApproachPoint.js')
let CylinderLocator = require('./CylinderLocator.js')
let Checkpoint_res = require('./Checkpoint_res.js')
let DigitDetector = require('./DigitDetector.js')
let ColourClassificationSrv = require('./ColourClassificationSrv.js')
let QRDetector = require('./QRDetector.js')

module.exports = {
  ValidRegionsMap: ValidRegionsMap,
  TerminalApproach: TerminalApproach,
  EllipseLocator: EllipseLocator,
  FeatureBuilder: FeatureBuilder,
  CheckpointProcessor: CheckpointProcessor,
  RingApproachPoint: RingApproachPoint,
  CylinderLocator: CylinderLocator,
  Checkpoint_res: Checkpoint_res,
  DigitDetector: DigitDetector,
  ColourClassificationSrv: ColourClassificationSrv,
  QRDetector: QRDetector,
};
