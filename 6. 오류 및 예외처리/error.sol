// 오류 처리: assert / revert / require 

//예외 처리: try / catch

//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/*require, revert 또는 assert를 호출하여 오류를 발생시킬 수 있습니다.

1) require는 실행 전에 입력 및 조건을 검증하는 데 사용됩니다.
2) revert는 require와 유사합니다.
3) assert는 절대 거짓이어서는 안 되는 코드를 확인하는 데 사용됩니다. (false) 실패한다는 것은 아마도 버그가 있다는 것을 의미합니다.
4) 사용자 정의 오류를 사용하여 가스를 절약합니다.
*/

contract Error_0{
    function testRequire(uint _i) public pure {
        // Require는 다음과 같은 조건을 검증하는 데 사용해야 합니다:
        // - 입력
        // - 실행 전 조건
        // - 호출의 값을 다른 함수로 반환합니다
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        // 되돌리기는 확인할 조건이 복잡할 때 유용합니다.
        // 이 코드는 위의 예제와 정확히 동일한 작업을 수행합니다
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

     uint public num;

    function testAssert() public view {
        // Assert는 내부 오류 테스트에만 사용해야 합니다,
        // 그리고 불변량을 확인합니다.

        // 여기서 우리는 num이 항상 0과 같다고 주장합니다
        // num의 값을 업데이트하는 것이 불가능하기 때문에
        assert(num == 0);
    }

     // custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});//잔액부족 
        }
    }
}