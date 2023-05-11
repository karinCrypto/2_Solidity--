// receive /fallback / call / delegatecall

//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// SC 주소로 이더를 받으려면 fallback, receive 함수가 필요하며 이 두함수 역시 payble을 적용해야한다.
// 모디파이어 payble은 이더를 받을 수 있게 돕는다
// payble은 이더를 받는 주소 또는 이더의 수신을 돕는 모디파이어가 아니라 
// 현재 사용하는 블록체인 네트워크의 대표 암호화폐 수신을 돕는다.
// 주소 payble을 적용함으로써, 주소는 현재 사용하는 블록체인 네트워크의 대표 암호화폐를 받을 수 있게

// msg.sender  address 현재 호출자 메신지 발신자
// msg.value   uint    메시지와 함께 전송된 wei의 개수

//address.balance와 msg.value 

contract add {
    
    function getBalance(address _address) public view returns(uint) {
        return _address.balance;
    }

    function getMsgValue() public payable returns(uint) {
        return msg.value;
    }
}


contract receive1 {
    event Obtain(address from, uint amount);
    receive() external payable {
        emit Obtain(msg.sender, msg.value);
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendEther() public payable {
        payable(address(this)).transfer(msg.value);
    }

}