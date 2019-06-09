
"use strict";

let CheckpointProcessor = require('./CheckpointProcessor.js')
let QRDetector2 = require('./QRDetector2.js')
let TerminalApproach = require('./TerminalApproach.js')
let FeatureBuilder = require('./FeatureBuilder.js')
let EllipseLocator = require('./EllipseLocator.js')
let QRDetector = require('./QRDetector.js')
let Checkpoint_res = require('./Checkpoint_res.js')
let TreasureLocator = require('./TreasureLocator.js')
let CylinderLocation = require('./CylinderLocation.js')
let RingApproachPoint = require('./RingApproachPoint.js')
let DigitDetector = require('./DigitDetector.js')
let MapDetector = require('./MapDetector.js')
let ReconfigParams = require('./ReconfigParams.js')
let ColourClassificationSrv = require('./ColourClassificationSrv.js')
let ValidRegionsMap = require('./ValidRegionsMap.js')

module.exports = {
  CheckpointProcessor: CheckpointProcessor,
  QRDetector2: QRDetector2,
  TerminalApproach: TerminalApproach,
  FeatureBuilder: FeatureBuilder,
  EllipseLocator: EllipseLocator,
  QRDetector: QRDetector,
  Checkpoint_res: Checkpoint_res,
  TreasureLocator: TreasureLocator,
  CylinderLocation: CylinderLocation,
  RingApproachPoint: RingApproachPoint,
  DigitDetector: DigitDetector,
  MapDetector: MapDetector,
  ReconfigParams: ReconfigParams,
  ColourClassificationSrv: ColourClassificationSrv,
  ValidRegionsMap: ValidRegionsMap,
};
