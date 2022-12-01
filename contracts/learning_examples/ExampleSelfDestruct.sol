//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract StartStopUpdateExample {
    receive() external payable {}

    function destroySmartContract() public {
        selfdestruct(payable(msg.sender));
    } // careful, this changes the state of the contract 
}     // but the address of the contract still exists. You
      // can still send ether to the address but cannot get it back
      // after self destruct.