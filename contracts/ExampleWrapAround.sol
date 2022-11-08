//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleWrapAround {

    uint256 public myUint; //0 - (2^256)-1

    uint8 public myUint8 = 2**4; //0 - (2^8)-1

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function incrementUint8() public {
        myUint8++; //increment by 1
    }

    function decrementUint() public {
        unchecked{ // will allow the function to wrap around to largest value
            myUint--;
        }
    }

}