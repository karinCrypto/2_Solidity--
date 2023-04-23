// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Points {
    
    uint public total;

    function addPoints(uint _point) public {
        total += _point;
    }

}
contract Points2 {
    
    uint public total;

    function addPoints(uint _point) public {
        total += _point*2;
    }

}
contract UserInfo {
    uint public total;

    function pointsUpWith_DelegateCall(address _address, uint _point) public {
        (bool success, ) = _address.delegatecall(
            abi.encodeWithSignature("addPoints(uint256)",_point)            
            );
        require(success, "Failed");
    }
}
