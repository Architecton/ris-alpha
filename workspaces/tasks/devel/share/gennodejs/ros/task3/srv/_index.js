
"use strict";

let CylinderLocation = require('./CylinderLocation.js')
let QRDetector = require('./QRDetector.js')
let RingApproachPoint = require('./RingApproachPoint.js')
let Checkpoint_res = require('./Checkpoint_res.js')
let MapDetector = require('./MapDetector.js')
let QRDetector2 = require('./QRDetector2.js')
let FeatureBuilder = require('./FeatureBuilder.js')
let ColourClassificationSrv = require('./ColourClassificationSrv.js')
let CheckpointProcessor = require('./CheckpointProcessor.js')
let ValidRegionsMap = require('./ValidRegionsMap.js')
let DigitDetector = require('./DigitDetector.js')
let TerminalApproach = require('./TerminalApproach.js')
let EllipseLocator = require('./EllipseLocator.js')
let TreasureLocator = require('./TreasureLocator.js')

module.exports = {
  CylinderLocation: CylinderLocation,
  QRDetector: QRDetector,
  RingApproachPoint: RingApproachPoint,
  Checkpoint_res: Checkpoint_res,
  MapDetector: MapDetector,
  QRDetector2: QRDetector2,
  FeatureBuilder: FeatureBuilder,
  ColourClassificationSrv: ColourClassificationSrv,
  CheckpointProcessor: CheckpointProcessor,
  ValidRegionsMap: ValidRegionsMap,
  DigitDetector: DigitDetector,
  TerminalApproach: TerminalApproach,
  EllipseLocator: EllipseLocator,
  TreasureLocator: TreasureLocator,
};
