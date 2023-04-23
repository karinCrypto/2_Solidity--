// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// delegate call: 컨트랙트 변경하지 않고, 해당 함수를 이용해서 함수 로직을 조금 바꿔줄 수 있어요.
//기존정보를 따로 새 컨트랙트에 입력이 필요하게되요. 두번일을 하게된다. 
// 외부 컨트랙트에 있는 함수를 호출> 외부 함수 로직만 실행 / 결괏값: 해당 함수가 명시된 컨트랙에 저장.
//장점: 컨트랙트의 로직을 쉽게 변경가능 
/*
컨트랙트 A(delegate call)를 통해 컨트랙트 B 호출시 B의 Storage를 변경시키지 않고, 
B의 코드를 A에서 실행합니다. = B의 코드를 A에 가지고 올 수 있음
msg.sender와 msg.value가 컨트랙트 A 호출시와 같고, 변동되지 않습니다.
(저장소 영향 미치지 않는다.)

// call
컨트랙트 A를 통해 컨트랙트 B의 함수 호출시 B의 Storage를 변경시키며 
msg.sender(호출자)는 컨트랙트A의 주소가 됩니다. (저장소 영향 미침)
*/ //외부함수 실행 시킴


contract Points {
    uint public total;
    event From(address from);

    function addPoints(uint _point) public {
        total += _point;
        emit From(msg.sender);
    }

}

contract UserInfo {
    uint public total;
    function pointUpWith_Call(address _address, uint _point) public {
        (bool success, ) = _address.call(
            abi.encodeWithSignature("addPoints(uint256)",_point)            
            );
        require(success, "Failed");
    }

    function pointUpWith_DelegateCall(address _address, uint _point) public {
        (bool success, ) = _address.delegatecall(
            abi.encodeWithSignature("addPoints(uint256)",_point)            
            );
        require(success, "Failed");
    }

}