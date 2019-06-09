
"use strict";

let SayCommand = require('./SayCommand.js');
let RingApproachPointResponse = require('./RingApproachPointResponse.js');
let TerminalApproachFeedback = require('./TerminalApproachFeedback.js');
let ApproachImageFeedback = require('./ApproachImageFeedback.js');
let ValidRegionsMapResponse = require('./ValidRegionsMapResponse.js');

module.exports = {
  SayCommand: SayCommand,
  RingApproachPointResponse: RingApproachPointResponse,
  TerminalApproachFeedback: TerminalApproachFeedback,
  ApproachImageFeedback: ApproachImageFeedback,
  ValidRegionsMapResponse: ValidRegionsMapResponse,
};
