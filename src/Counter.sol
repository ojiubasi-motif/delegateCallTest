// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    address manipulator;

    function implementNumberIncrement(address _incrementor) external {
        manipulator = _incrementor;
    }

    fallback() external payable {
        manipulator.delegatecall(msg.data);
    }
}

contract Executioner {
    uint256 public num;

    function incrementnumber() external returns (uint) {
        return num++;
    }
}

contract User {
    function addtoNumber(address _increment) external {
        _increment.call(
            abi.encodeWithSelector(bytes4(keccak256("incrementnumber()")))
        );
    }
}
