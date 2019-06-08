
"use strict";

let ReconfigParams = require('./ReconfigParams.js')
let Checkpoint_res = require('./Checkpoint_res.js')
let QRDetector2 = require('./QRDetector2.js')
let DigitDetector = require('./DigitDetector.js')
let TerminalApproach = require('./TerminalApproach.js')
let CylinderLocation = require('./CylinderLocation.js')
let MapDetector = require('./MapDetector.js')
let RingApproachPoint = require('./RingApproachPoint.js')
let ValidRegionsMap = require('./ValidRegionsMap.js')
let FeatureBuilder = require('./FeatureBuilder.js')
let TreasureLocator = require('./TreasureLocator.js')
let ColourClassificationSrv = require('./ColourClassificationSrv.js')
let QRDetector = require('./QRDetector.js')
let CheckpointProcessor = require('./CheckpointProcessor.js')
let EllipseLocator = require('./EllipseLocator.js')

module.exports = {
  ReconfigParams: ReconfigParams,
  Checkpoint_res: Checkpoint_res,
  QRDetector2: QRDetector2,
  DigitDetector: DigitDetector,
  TerminalApproach: TerminalApproach,
  CylinderLocation: CylinderLocation,
  MapDetector: MapDetector,
  RingApproachPoint: RingApproachPoint,
  ValidRegionsMap: ValidRegionsMap,
  FeatureBuilder: FeatureBuilder,
  TreasureLocator: TreasureLocator,
  ColourClassificationSrv: ColourClassificationSrv,
  QRDetector: QRDetector,
  CheckpointProcessor: CheckpointProcessor,
  EllipseLocator: EllipseLocator,
};
