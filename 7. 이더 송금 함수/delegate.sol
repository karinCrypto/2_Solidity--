//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

//delegate를 통해 외부 스마트 컨트랙트에 있는 함수 호출 가능
//함수의 로직만 실행되고 delegatecall이 명시된 스마트 컨트랙트에 저장된다.
// 로직이 있는 외부 스마트 컨트랙트에 저장된 정보가 없기에 새 로직을 가진 스마트컨트랙트를 배포해서 사용할 수 있다.


// NOTE: Deploy this contract first
contract B {
    // NOTE: storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}
