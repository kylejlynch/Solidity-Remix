//SPDX-License-Identifier: MIT 

pragma solidity 0.7.0;

contract ExampleExceptionRequire {

    mapping (address => uint8) public balanceReceived;

    function receiveMoney() public payable {
        assert(msg.value == uint8(msg.value));
        balanceReceived[msg.sender] += uint8(msg.value);
    } //consumes all gas, used to validate invariants, technical errors

    function withdrawMoney(address payable _to, uint8 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not enough funds, aborting!");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    } //require returns any remaining gas, better for validating user input
}

//if (amount > msg.value / 2 ether) {
//  revert("Not enough Ether provided.");
//}
//or
//require(amount <= msg.value / 2 ether, "Not enough Ether provided.");