// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ProgramBase} from "./ProgramBase.sol";

contract RewardProgram is ProgramBase {
    event RewardGranted(address indexed to, uint256 amount, bytes32 reasonId);

    constructor() ProgramBase(msg.sender) {}

    function grant(address to, uint256 amount, bytes32 reasonId)
        external whenNotPaused
    {
        emit RewardGranted(to, amount, reasonId);
    }
}
