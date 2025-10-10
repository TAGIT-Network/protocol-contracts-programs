// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ProgramBase} from "./ProgramBase.sol";

contract RecallProgram is ProgramBase {
    event RecallIssued(address indexed asset, bytes32 recallId, string reason);
    event RecallResolved(address indexed asset, bytes32 recallId);

    mapping(bytes32 => bool) public activeRecall;

    constructor() ProgramBase(msg.sender) {}

    function issueRecall(address asset, bytes32 recallId, string calldata reason)
        external whenNotPaused
    {
        activeRecall[recallId] = true;
        emit RecallIssued(asset, recallId, reason);
    }

    function resolveRecall(address asset, bytes32 recallId)
        external whenNotPaused
    {
        activeRecall[recallId] = false;
        emit RecallResolved(asset, recallId);
    }
}
