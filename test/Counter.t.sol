// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {BEX,IERC20DexModule} from "../src/BEXinterface.sol";

BEX constant bexpool = BEX(0x0d5862FDbdd12490f9b4De54c236cff63B038074);

//forge test --rpc-url  https://artio.rpc.berachain.com -vvvvv

contract BEXTest is Test {
    address public USDC = 0x6581e59A1C8dA66eD0D313a0d4029DcE2F746Cc5;
    address user = 0x0006C9919fbc3B2bb73f1f359499E982191bbc66;
    function setUp() public {
    }

    function testSwap() public {
                IERC20DexModule.BatchSwapStep memory step = IERC20DexModule.BatchSwapStep({
            poolId:0x7D5b5C1937ff1b18B45AbC64aeAB68663a7a58Ab,
            assetIn:0x0000000000000000000000000000000000000000,   // BERA
            amountIn:20*1e15,  // 0.02
            assetOut:USDC,
            amountOut: 1000000000000000000,
            userData:bytes("")
            
        });
        vm.prank(user);
        IERC20DexModule.BatchSwapStep[] memory steps = new IERC20DexModule.BatchSwapStep[](1);
        steps[0] = step;
        bexpool.batchSwap{value:20*1e15}(
            0,
            steps,
            block.timestamp + 1000
        );
    }

    
}
