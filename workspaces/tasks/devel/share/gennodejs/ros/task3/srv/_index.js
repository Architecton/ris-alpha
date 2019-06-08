
"use strict";

let QRDetector2 = require('./QRDetector2.js')
let ValidRegionsMap = require('./ValidRegionsMap.js')
let TerminalApproach = require('./TerminalApproach.js')
let EllipseLocator = require('./EllipseLocator.js')
let TreasureLocator = require('./TreasureLocator.js')
let FeatureBuilder = require('./FeatureBuilder.js')
let CheckpointProcessor = require('./CheckpointProcessor.js')
let RingApproachPoint = require('./RingApproachPoint.js')
let CylinderLocation = require('./CylinderLocation.js')
let Checkpoint_res = require('./Checkpoint_res.js')
let DigitDetector = require('./DigitDetector.js')
let MapDetector = require('./MapDetector.js')
let ColourClassificationSrv = require('./ColourClassificationSrv.js')
let QRDetector = require('./QRDetector.js')

module.exports = {
  QRDetector2: QRDetector2,
  ValidRegionsMap: ValidRegionsMap,
  TerminalApproach: TerminalApproach,
  EllipseLocator: EllipseLocator,
  TreasureLocator: TreasureLocator,
  FeatureBuilder: FeatureBuilder,
  CheckpointProcessor: CheckpointProcessor,
  RingApproachPoint: RingApproachPoint,
  CylinderLocation: CylinderLocation,
  Checkpoint_res: Checkpoint_res,
  DigitDetector: DigitDetector,
  MapDetector: MapDetector,
  ColourClassificationSrv: ColourClassificationSrv,
  QRDetector: QRDetector,
};
