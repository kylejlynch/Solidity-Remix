//SPDX-License-Identifier: MIT 

pragma solidity 0.8.15;

contract SampleContract {

    string public myString = "Hello World";

    function updateString(string memory _newString) public payable { //payable makes it possible to send value (Eth) to contract

        if(msg.value == 1 ether) {   //transaction will still send if wrong value, can either code to error or send back back to sender
                myString = _newString;
        } else {
            payable(msg.sender).transfer(msg.value); //payable modifier needed to make address payable (receive Eth)
        }                                            //sends value back if not correct amount (1 Eth)
        
    }

}