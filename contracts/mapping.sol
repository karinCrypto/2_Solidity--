// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// 매핑 
// 매핑 선언
// SET GET DELETE=REMOVE

  contract Mapping{
      mapping(address => uint) public balances;
      mapping(address =>mapping(address => bool)) public isFreiend;
      
      function example() external {
          balances[msg.sender] = 123;
          uint bal = balances[msg.sender];
          uint bal2 = balances[address(1)];
          balances[msg.sender] += 456; // 123+456 = 579  

        delete balances[msg.sender]; //0 
 
          isFreiend[msg.sender] [address(this)] = true; 

      } 

  } 

 