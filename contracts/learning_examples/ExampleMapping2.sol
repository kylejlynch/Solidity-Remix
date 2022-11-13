//SPDX-License-Identifier: MIT 

pragma solidity 0.8.15;

contract ExampleMappingWithdrawals {

    mapping (address => uint) public balanceReceived;

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAllMoney(address payable _to) public {
        uint balanceToSendOut = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0; //avoids re-entry problem, inherently secure (cannot withraw more than put in)
        _to.transfer(balanceToSendOut);
    }
}


// function withdrawAllMoney(address payable _to) public {
//     _to.transfer(balanceReceived[msg.sender]); //checks,effects,interactions pattern, do not do it this way
//     balanceReceived[msg.sender] = 0; //user can actually re-enter before balance is set to zero, ethereum classic
// }