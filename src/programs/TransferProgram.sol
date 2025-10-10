// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ProgramBase} from "./ProgramBase.sol";

contract TransferProgram is ProgramBase {
    event TransferLogged(address indexed asset, address indexed from_, address indexed to, bytes32 shipmentId);

    constructor() ProgramBase(msg.sender) {}

    function logTransfer(address asset, address from_, address to, bytes32 shipmentId)
        external whenNotPaused
    {
        emit TransferLogged(asset, from_, to, shipmentId);
    }
}
