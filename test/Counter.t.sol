// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter,Executioner,User} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;
    Executioner public executioner;
    User public user;

    function setUp() public {
        counter = new Counter();
        executioner = new Executioner();
        user = new User();

        counter.implementNumberIncrement(address(executioner));
        
    }

    function testDelegateCall() public{
        address proxy = address(counter);
        // address implement = address(executioner);

        user.addtoNumber(proxy);

        uint256 checkifnumIncrement = counter.number();

        assertEq(checkifnumIncrement,1);
        // assertEq();
    }

}
