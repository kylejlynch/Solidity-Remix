//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleUint {

    uint256 public myUint; //0 - (2^256)-1

    uint8 public myUint8 = 250; //0 - (2^8)-1

    int public myInt = -10; // -2^128 to +(2^128)-1

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function incrementUint8() public {
        myUint8++; //increment by 1
    }

    function decrementUint() public {
        myUint--; //Uint cannot take values less than 0 (will fail)
    }

    function incrementInt() public {
        myInt++;
    }

}