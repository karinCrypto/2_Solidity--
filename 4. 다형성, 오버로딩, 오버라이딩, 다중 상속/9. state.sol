// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//상속된 상태 변수 섀도잉: 상속된 상태 변수를 올바르게 재정의하는 방법

// 함수와 달리 상태 변수는 하위 계약에서 다시 선언하여 재정의할 수 없습니다.

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}

// Shadowing is disallowed in Solidity 0.6
// This will not compile
// contract B is A {
//     string public name = "Contract B";
// }

contract C is A {
    //  상속된 상태 변수를 재정의하는 올바른 방법
    constructor() {
        name = "Contract C";
    }

    // C.getName returns "Contract C"
}