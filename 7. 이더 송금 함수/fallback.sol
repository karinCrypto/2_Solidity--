//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

//payble이 적용된 fallback함수로 이더받기

contract Obtain1{

    event Obtain(address from, uint amount);
    fallback() external payable {
        emit Obtain(msg.sender, msg.value);
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendEther() public payable {
        payable(address(this)).transfer(msg.value);
    }

}

/* fallback 함수는 무기명 함수 
즉, 이름이 없는 함수이며 컨트랙트에서 하나의 디폴트 함수와 같다.
fallback 함수는 직접 호출되지 않으며, 다음과 같은 상황에서 실행된다.

호출한 함수가 컨트렉트 내에서 조회되지 않을 경우
외부에서 특정 컨트렉트를 호출했을 때, 해당 호출 주소(function identifier)가 확인되지 않으면 디폴트로 fallback 함수가 실행된다.

이더(ETH, ether)를 보낼 때 자동으로 실행
다시 말해, 스마트 컨트렉트에 '함수로 요청'을 보냈는데 '실제로 없는 함수를 호출'하거나 또는 '이더를 보낼 때 fallback 함수가 디폴트로 실행'된다.
'fallback 함수'는 '디폴트 함수'와 같기 때문에 solidity에서 하나의 컨트렉트는 하나의 'fallback 함수'를 가질 수 있다.


fallback 함수는 이더를 보낼 때 실행되고, 이더를 받을 때는 receive 함수가 실행된다.
즉, 하나의 기능을 세분화시켜 두가지로 나누어 놓은 것이다. 
*/