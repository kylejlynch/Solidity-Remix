//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleViewPure {

    uint public myStorageVariable;

    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable;
    }

    function getAddition(uint a, uint b) public pure returns(uint) {
        return a+b;
    }

    function setMyStorageVariable(uint _newVar) public { // writing function because it doesn't have view/pure
        myStorageVariable = _newVar;                     // writing functions usually do not contain return statements, usually no terminal to see output, 
    }                                                    // but can be used for interaction between contracts

}