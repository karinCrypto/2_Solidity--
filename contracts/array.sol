//array정리 

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract HelloWorld {
    uint[] public dynamicArray = [42,20];
    uint[4] public fixedArray;

    mapping (address => mapping (address => bool))public isFriend;
    function examples() external returns (uint[]memory){
        dynamicArray.push(50); //[42,20, 50, 50]
       
        uint[] memory a = new uint[](4); // 0~3
        isFriend[msg.sender][address(1)] = true;
        return a;
        }
}