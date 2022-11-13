//SPDX-License-Identifier: MIT 

pragma solidity 0.8.15;

contract SampleFallback {

    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public myUint;

    function setMyUint(uint _myNewUint) public {
        myUint = _myNewUint;
    }

    receive() external payable {        //hits this if some value AND no data is sent to contract, if data is received: needs a Fallback function
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    fallback() external payable {       //payable is optional, but if no receive function then need payable to receive value without data
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }
}
//0xe492fd840000000000000000000000000000000000000000000000000000000000000001
//0xe492fd842fb25dc4b3c624c80776108b452a545c682a78e4252b5560c6537b79  <--  web3.utils.sha3("setMyUint(uint256)")
//function identifier: e492fd84
//hits fallback if function identifier not known

//writing transactions: mined
//reading transactions: calls- only against the local blockchain node, virtually free