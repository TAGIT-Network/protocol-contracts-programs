// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Script.sol";
import {TransferProgram} from "../src/programs/TransferProgram.sol";
import {RecallProgram} from "../src/programs/RecallProgram.sol";
import {RewardProgram} from "../src/programs/RewardProgram.sol";

contract DeployPrograms is Script {
    function run() external {
        uint256 pk = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(pk);

        TransferProgram transferProgram = new TransferProgram();
        RecallProgram   recallProgram   = new RecallProgram();
        RewardProgram   rewardProgram   = new RewardProgram();

        vm.stopBroadcast();

        console2.log("TransferProgram", address(transferProgram));
        console2.log("RecallProgram", address(recallProgram));
        console2.log("RewardProgram", address(rewardProgram));
    }
}
