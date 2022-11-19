//SPDX-License-Identifier: MIT 

pragma solidity 0.8.15;

contract Sender {

    receive() external payable {}

    function withdrawTransfer(address payable _to) public {
        _to.transfer(10);                                       //throws an error when the transfer fails
    }

    function withdrawSend(address payable _to) public {
        //_to.send(10);                                         //throws a boolean when the transfer fails

        bool isSent = _to.send(10);

        require(isSent, "sending the funds was unsuccessful");  //do this instead if using send
    }
}

contract ReceiverNoAction {

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    receive() external payable {}   //no error when receiving Wei
}

contract ReceiverAction {
    uint public balanceReceived;

    receive() external payable {
        balanceReceived += msg.value; //causes an error due to not enough gas, storage variable is expensive
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }
}