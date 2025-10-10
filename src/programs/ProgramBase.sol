// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {IProgramGuard} from "../interfaces/IProgramGuard.sol";

abstract contract ProgramBase is IProgramGuard {
    bool private _paused;
    address public immutable guardian;

    modifier onlyGuardian() {
        if (msg.sender != guardian) revert NotAuthorized();
        _;
    }
    modifier whenNotPaused() {
        if (_paused) revert NotAuthorized();
        _;
    }

    constructor(address _guardian) {
        guardian = _guardian;
    }

    function pause() external onlyGuardian { _paused = true; emit Paused(msg.sender); }
    function unpause() external onlyGuardian { _paused = false; emit Unpaused(msg.sender); }
    function paused() public view returns (bool) { return _paused; }
}
