
"use strict";

let DigitDetector = require('./DigitDetector.js')
let TreasureLocator = require('./TreasureLocator.js')
let ValidRegionsMap = require('./ValidRegionsMap.js')
let EllipseLocator = require('./EllipseLocator.js')
let FeatureBuilder = require('./FeatureBuilder.js')
let CheckpointProcessor = require('./CheckpointProcessor.js')
let RingApproachPoint = require('./RingApproachPoint.js')
let Checkpoint_res = require('./Checkpoint_res.js')
let ColourClassificationSrv = require('./ColourClassificationSrv.js')
let TerminalApproach = require('./TerminalApproach.js')
let QRDetector = require('./QRDetector.js')
let CylinderLocator = require('./CylinderLocator.js')

module.exports = {
  DigitDetector: DigitDetector,
  TreasureLocator: TreasureLocator,
  ValidRegionsMap: ValidRegionsMap,
  EllipseLocator: EllipseLocator,
  FeatureBuilder: FeatureBuilder,
  CheckpointProcessor: CheckpointProcessor,
  RingApproachPoint: RingApproachPoint,
  Checkpoint_res: Checkpoint_res,
  ColourClassificationSrv: ColourClassificationSrv,
  TerminalApproach: TerminalApproach,
  QRDetector: QRDetector,
  CylinderLocator: CylinderLocator,
};
