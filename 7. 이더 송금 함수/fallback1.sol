// fallback 특수함수 설명
//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;
/*
존재하지 않는 함수가 호출되거나 
이더는 계약으로 직접 전송되지만 receive()존재하지 않거나 msg.data비어 있지 않습니다.
fallbacktransfer또는 send에 의해 호출될 때 2300 가스비 제한이 있습니다 
*/

contract Fallback {
    event Log(string func, uint gas);

    // 폴백 함수는 반드시 외부로 선언해야 합니다.
    fallback() external payable {
        // 보내기_sender/이동_transfer (2300 가스를 이 폴백 기능으로 전달)
        // 호출_call (모든 가스 전달)
        emit Log("fallback", gasleft());
    }

    // 수신은 msg.data가 비어 있을 때 트리거되는 폴백의 변형입니다.
    receive() external payable {
        emit Log("receive", gasleft());
    }

    // 컨트랙트의 잔액을 확인하는 도우미 기능
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}


//fallbackbytes선택적으로 입력 및 출력에 사용할 수 있습니다.
// TestFallbackInputOutput -> FallbackInputOutput -> Counter
contract FallbackInputOutput {
    address immutable target; // 불변의 타겟 

    constructor(address _target) {
        target = _target;
    }

    fallback(bytes calldata data) external payable returns (bytes memory) {
        (bool ok, bytes memory res) = target.call{value: msg.value}(data);
        require(ok, "call failed");
        return res;
    }
}

contract Counter {
    uint public count;

    function get() external view returns (uint) {
        return count;
    }

    function inc() external returns (uint) {
        count += 1;
        return count;
    }
}

contract TestFallbackInputOutput {
    event Log(bytes res);

    function test(address _fallback, bytes calldata data) external {
        (bool ok, bytes memory res) = _fallback.call(data);
        require(ok, "call failed");
        emit Log(res);
    }

    function getTestData() external pure returns (bytes memory, bytes memory) {
        return (abi.encodeCall(Counter.get, ()), abi.encodeCall(Counter.inc, ()));
    }
}

