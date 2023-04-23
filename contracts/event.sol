//event정리 

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract event1{
    event Message(address indexed _from, address indexed _to, string message); // only up to 3 params can be indexed, even if there are 4+
    function sendMessage(address _to, string calldata message) external { // strings are dynamic type so 'calldata' works
        emit Message(msg.sender, _to, message);
    }
}