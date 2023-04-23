//반복문 정리 

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract while_1{
    function fun1() public pure returns (uint){
        uint result = 0;
        uint a =3;
        while(a>0){
            result = result + a;
            --a;//2
        }
        return result;//6 3회실행
    }
}