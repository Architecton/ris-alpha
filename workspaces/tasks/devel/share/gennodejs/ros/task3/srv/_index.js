
"use strict";

let Checkpoint_res = require('./Checkpoint_res.js')
let DigitDetector = require('./DigitDetector.js')
let CylinderLocator = require('./CylinderLocator.js')
let TerminalApproach = require('./TerminalApproach.js')
let RingApproachPoint = require('./RingApproachPoint.js')
let ValidRegionsMap = require('./ValidRegionsMap.js')
let FeatureBuilder = require('./FeatureBuilder.js')
let TreasureLocator = require('./TreasureLocator.js')
let ColourClassificationSrv = require('./ColourClassificationSrv.js')
let QRDetector = require('./QRDetector.js')
let CheckpointProcessor = require('./CheckpointProcessor.js')
let EllipseLocator = require('./EllipseLocator.js')

module.exports = {
  Checkpoint_res: Checkpoint_res,
  DigitDetector: DigitDetector,
  CylinderLocator: CylinderLocator,
  TerminalApproach: TerminalApproach,
  RingApproachPoint: RingApproachPoint,
  ValidRegionsMap: ValidRegionsMap,
  FeatureBuilder: FeatureBuilder,
  TreasureLocator: TreasureLocator,
  ColourClassificationSrv: ColourClassificationSrv,
  QRDetector: QRDetector,
  CheckpointProcessor: CheckpointProcessor,
  EllipseLocator: EllipseLocator,
};
