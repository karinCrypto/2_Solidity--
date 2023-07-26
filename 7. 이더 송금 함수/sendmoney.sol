 //받을 때
// SPDX-License-Identifier: GPL-3.0

// 받을때 : payable, receive(), fallback()

//자금 입금과 인출

pragma solidity >=0.7.0 <0.9.0;

contract MappingsStructExample {

    function getBalance() public view returns(uint) {// 자산을 얻는 함수
        return address(this).balance;
    }

    function sendMoney() public payable { // 돈을 받는 함수

    }

    function withdrawAllMoney(address payable _to) public { // 전체인출 함수 > 값이 0 
        _to.transfer(address(this).balance);
    }
}


