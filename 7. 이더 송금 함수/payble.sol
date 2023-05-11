//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;
// payable은 계약의 주소를 가지고 온다.

contract Payable {
    // 수취인 주소는 Ether를 받을 수 있습니다.
    address payable public owner;

    // 지불 가능한 생성자는 Ether를 받을 수 있습니다.
    constructor() payable {
        owner = payable(msg.sender);
    }

    // 이 컨트랙트에 Ether를 입금하는 기능.
    // 일부 Ether와 함께 이 함수를 호출합니다.
    // 이 계약의 잔액은 자동으로 업데이트됩니다.
    function deposit() public payable {}

    // 일부 Ether와 함께 이 함수를 호출합니다.
    // 이 함수는 지불할 수 없기 때문에 함수에서 오류가 발생합니다.
    function notPayable() public {}

    //이 컨트랙트에서 모든 이더를 인출하는 기능.
    function withdraw() public {
        // 이 계약에 저장된 Ether의 양을 얻습니다.
        uint amount = address(this).balance;

        // 소유자에게 모든 Ether 보내기
        // 소유자의 주소를 지불할 수 있으므로 소유자는 Ether를 받을 수 있습니다.
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // 이 컨트랙트에서 입력 주소로 Ether를 전송하는 기능
    function transfer(address payable _to, uint _amount) public {
        // "to"는 지불 대상으로 선언됩니다.
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
}