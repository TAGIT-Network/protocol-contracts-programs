// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IProgramGuard {
    error NotAuthorized();
    event Paused(address by);
    event Unpaused(address by);

    function pause() external;
    function unpause() external;
    function paused() external view returns (bool);
}
