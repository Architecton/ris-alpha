
"use strict";

let ColourClassificationSrv = require('./ColourClassificationSrv.js')
let DigitDetector = require('./DigitDetector.js')
let Checkpoint_res = require('./Checkpoint_res.js')
let ReconfigParams = require('./ReconfigParams.js')
let QRDetector2 = require('./QRDetector2.js')
let TerminalApproach = require('./TerminalApproach.js')
let CheckpointProcessor = require('./CheckpointProcessor.js')
let TreasureLocator = require('./TreasureLocator.js')
let MapDetector = require('./MapDetector.js')
let ValidRegionsMap = require('./ValidRegionsMap.js')
let FeatureBuilder = require('./FeatureBuilder.js')
let CylinderLocation = require('./CylinderLocation.js')
let EllipseLocator = require('./EllipseLocator.js')
let RingApproachPoint = require('./RingApproachPoint.js')
let QRDetector = require('./QRDetector.js')

module.exports = {
  ColourClassificationSrv: ColourClassificationSrv,
  DigitDetector: DigitDetector,
  Checkpoint_res: Checkpoint_res,
  ReconfigParams: ReconfigParams,
  QRDetector2: QRDetector2,
  TerminalApproach: TerminalApproach,
  CheckpointProcessor: CheckpointProcessor,
  TreasureLocator: TreasureLocator,
  MapDetector: MapDetector,
  ValidRegionsMap: ValidRegionsMap,
  FeatureBuilder: FeatureBuilder,
  CylinderLocation: CylinderLocation,
  EllipseLocator: EllipseLocator,
  RingApproachPoint: RingApproachPoint,
  QRDetector: QRDetector,
};
