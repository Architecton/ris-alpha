
"use strict";

let QRDetector = require('./QRDetector.js')
let FeatureBuilder = require('./FeatureBuilder.js')
let Checkpoint_res = require('./Checkpoint_res.js')
let ColourClassificationSrv = require('./ColourClassificationSrv.js')
let ValidRegionsMap = require('./ValidRegionsMap.js')
let DigitDetector = require('./DigitDetector.js')
let CylinderLocator = require('./CylinderLocator.js')
let EllipseLocator = require('./EllipseLocator.js')
let CheckpointProcessor = require('./CheckpointProcessor.js')
let TreasureLocator = require('./TreasureLocator.js')
let RingApproachPoint = require('./RingApproachPoint.js')
let TerminalApproach = require('./TerminalApproach.js')

module.exports = {
  QRDetector: QRDetector,
  FeatureBuilder: FeatureBuilder,
  Checkpoint_res: Checkpoint_res,
  ColourClassificationSrv: ColourClassificationSrv,
  ValidRegionsMap: ValidRegionsMap,
  DigitDetector: DigitDetector,
  CylinderLocator: CylinderLocator,
  EllipseLocator: EllipseLocator,
  CheckpointProcessor: CheckpointProcessor,
  TreasureLocator: TreasureLocator,
  RingApproachPoint: RingApproachPoint,
  TerminalApproach: TerminalApproach,
};
