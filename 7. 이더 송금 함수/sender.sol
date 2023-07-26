 //받을 때
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//이더를 받는 방법?
//Ether를 받는 컨트랙트는 아래의 기능 중 적어도 하나를 가지고 있어야 합니다.

// 받을때 : payable, receive(), fallback()
//receive() external payable
//fallback() external payable
//receive() msg.data그렇지 않으면 fallback()호출됩니다.

contract Bank2{
     // 예금자주소 => 금액
    mapping (address => uint) public balance;
    event log(string text);

    function deposit() public payable returns(uint){
        balance[msg.sender] += msg.value; // X += Y = X=X+Y
        return msg.value;
    }

    function getBalanceByAddr(address _addr) public view returns(uint){
        return balance[_addr];
    } 

    receive() external payable {
        emit log("in receive");
    }
    fallback() external payable {
        emit log("in fallback");
    }
 }

// 이더를 받을때  함수 세개 

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // 이 기능은 더 이상 Ether를 보내는 데 권장되지 않습니다.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        //Send는 성공 또는 실패를 나타내는 부울 값을 반환합니다.
        // 이 기능은 Ether를 보내는 데 권장되지 않습니다.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // 성공 또는 실패를 나타내는 부울 값을 반환합니다.
        // 현재 권장되는 사용 방법입니다.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}