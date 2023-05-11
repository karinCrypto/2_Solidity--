// SPDX-License-Identifier: GPL-3.0
//인터페이스를 활용해 배포된 스마트 컨트랙의 상호작용 

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

contract Load {
    function versionCheck(address _addr) public returns(uint) {
        return System(_addr).versionCheck();
    }
    function errorCheck(address _addr) public returns(bool) {
        return System(_addr).errorCheck();
    }
    function boot (address _addr) public returns(uint, bool) {
        return System(_addr).boot();
    }
}
