//이더송수신 : send transfer call _ address,payble,msg.sender,msg.value
//adress/payble/msg/ send/ call /transfer
// 주소 / 지불 / 메세지를 보내는이 / 받는이 / 콜데이터를 받는 함수 / 금액을 전송, 변환 

//SC가 이더를 받는 함수: fallback(풀백)과 receive (받는) 
//call과 비슷한 함수 delegatecall


//주소를 부여받는 대상 "사람"(EOA)=Externally Owned Account(외부소유 계정)  
// "SC=스마트 컨트랙트"(CA) = Contract Account = 컨트랙트 계정
//지갑을 통헤 게인 주소인 EOA를 발급받기 가능 
//SC주소인 CA는 스마트 컨트랙트 배포시 생성된다. 

// 이더를 보내는 방법?
transfer(2300 가스, 오류 발생)
send(2300 가스, 부울 반환)
call(모든 가스 전달 또는 가스 설정, 부울 반환)
이더를 받는 방법? 
Ether 받는 컨트랙트는 아래 기능 중 적어도 하나를 가지고 있어야 합니다.

receive() external payable
fallback() external payable
receive()
msg.data 비어 있으면 호출되고 
그렇지 않으면 fallback()호출됩니다.

어떤 방법을 사용해야 합니까?
call2019년 12월 이후에는 재진입 가드와 함께 사용하는 것이 좋습니다.

재진입 방지
다른 계약을 호출하기 전에 모든 상태 변경
재진입 보호 수정자 사용

/*fallback 함수는 이더를 보낼 때 실행되고, 이더를 받을 때는 receive 함수가 실행된다.
즉, 하나의 기능을 세분화시켜 두가지로 나누어 놓은 것이다. 
*/



//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract ReceiveEther {
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback() 
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    // Function to receive Ether. msg.data must be empty(받는 사람 데이터가 반드시 공백) 
    receive() external payable {}

    // Fallback function is called when msg.data is not empty ( 받는 사람 데이터가 공백X) 
    fallback() external
     payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    } 

    function sendViaSend(address payable _to) public payable {
        //Send는 성공 또는 실패를 나타내는 부울 값을 반환합니다.
        // 이 기능은 Ether 전송에 더 이상 권장되지 않습니다.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    } 

    function sendViaCall(address payable _to) public payable {
        // 호출은 성공 또는 실패를 나타내는 부울 값을 반환합니다.
        // 이것이 현재 권장되는 사용 방법입니다.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
