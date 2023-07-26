//이더 송금 함수 실습 (오류 코드_ 수정 필요)

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

// 보낼때 : call, send, transfer
// 받을때 : payable, receive(), fallback()

contract Bank1{
    // 예금자 주소 => 금액 
    mapping (address => uint) public balance;
    event log(bytes data);

    function deposit() public payable returns (uint){
    balance[msg.sender] += msg.value;
    return msg.value;
    }
    function withdrawByCall(address payable _addr, uint _amount) public {
        require(balance[msg.sender] > _amount,"Insufficient Balance");
        balance[msg.sender] -= _amount;
        (bool success, bytes memory data ) = _addr.call{value: _amount}("");
        //bytes memory data = abi.encodeWithSignature("abcdefg(address, uint)", _addr, _value);
        //(bool success, bytes memory data ) = _addr.call{value: _amount}(data);

        (bool success, bytes memory data ) = _addr.call{value: _amount}(data);
         emit log(data);
         require(success, "Transfer Failed");
    }

    function withdrawBySend(address payable _addr, uint _amount) public {
        require(balance[msg.sender] > _amount,"Insufficient Balance");
        balance[msg.sender] -= _amount;
        (bool success) = _addr.send(_amount);
        require(success, "Transfer Failed");
    }

    function withdrawByTransfer(address payable _addr, uint _amount) public {
        require(balance[msg.sender] > _amount,"Insufficient Balance");
        balance[msg.sender] -= _amount;
        _addr.transfer(_amount);
    }

    function getMyBalance() public view returns(uint){
        return balance[msg.sender];
    }

}


