//인터페이스 
//<제한적>
//SC랑만 상속 가능
//불완전 함수를 명시할것
//함수의 가시성 지정자 external
//생성자를 정의 불가/ 상태변수를 정의 불가/ 모디파이어를 정의 불가 


// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface System {
    function versionCheck() external returns(uint); 
    function errorCheck() external returns(bool);
    function boot() external returns(uint, bool);
}
contract Computer is System {
    function versionCheck() public pure override returns(uint) {
        return 3;
    }
    function errorCheck() public pure override returns(bool) {
        return true;
    }
    function boot () public pure override returns(uint, bool) {
        return (versionCheck(),errorCheck());
    }
}

contract SmartPhone is System {
    function versionCheck() public pure override returns(uint) {
        return 25;
    }
    function errorCheck() public pure override returns(bool) {
        return true;
    }
    function boot () public pure override returns(uint, bool) {
        return (versionCheck(),errorCheck());
    }
}
