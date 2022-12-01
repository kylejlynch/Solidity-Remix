//SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract EventExample {

    mapping(address => uint) public tokenBalance;

    event TokensSent(address indexed _from, address indexed _to, uint _amount); //events are meant for communicating to the outside
                                                                                //indexed allows for filtering in dapp, sets indexed=true in abi
    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns(bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit TokensSent(msg.sender, _to, _amount);

        return true;
    } //function return is only for inter-smart contract or within the smart contract, cannot get the return from the outside
} 