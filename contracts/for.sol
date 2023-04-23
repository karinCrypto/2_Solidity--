//반복문 정리 

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract for_1{
    function fun1()public pure returns(uint){
        uint result = 0;
        for (uint a = 0; a<3; ++a){
            result = result + a;
        } //반복문은 총 3회 실행
        return result;
        }
}