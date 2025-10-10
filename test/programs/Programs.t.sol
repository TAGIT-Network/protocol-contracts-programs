// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import {TransferProgram} from "../../src/programs/TransferProgram.sol";
import {RecallProgram}   from "../../src/programs/RecallProgram.sol";
import {RewardProgram}   from "../../src/programs/RewardProgram.sol";

contract ProgramsTest is Test {
    TransferProgram transferProgram;
    RecallProgram recallProgram;
    RewardProgram rewardProgram;

    function setUp() public {
        transferProgram = new TransferProgram();
        recallProgram   = new RecallProgram();
        rewardProgram   = new RewardProgram();
    }

    function testTransferLog() public {
        transferProgram.logTransfer(address(0xBEEF), address(this), address(0xCAFE), keccak256("ship-1"));
    }

    function testRecallLifecycle() public {
        bytes32 id = keccak256("recall-1");
        recallProgram.issueRecall(address(0xBEEF), id, "quality");
        assertTrue(recallProgram.activeRecall(id));
        recallProgram.resolveRecall(address(0xBEEF), id);
        assertFalse(recallProgram.activeRecall(id));
    }

    function testRewardGrant() public {
        rewardProgram.grant(address(0xF00D), 100, keccak256("scan"));
    }
}
