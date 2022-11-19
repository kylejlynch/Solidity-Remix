//SPDX-License-Identifier: MIT 

pragma solidity 0.8.15;

contract WillThrow {
    error NotAllowedError(string);                      //for custom errors
    function aFunction() public pure {
        //require(false, "Error message");
        //assert(false);
        revert NotAllowedError("You are not allowed"); //for custom errors
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowLevelData);
    function catchTheError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
            //add code here if it works
        } catch Error(string memory reason) {   //require throws Error
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode) {         //assert throws Panic
            emit ErrorLogCode(errorCode);
        } catch (bytes memory lowLevelData) {    //custom
            emit ErrorLogBytes(lowLevelData);    //returns function signature followed by bytes encoded string from above (You are not allowed) (add 0x)
        }
    }
}