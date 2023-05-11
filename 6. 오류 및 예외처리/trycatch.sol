//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

//try catch: 예외 처리 

// External contract used for try / catch examples: 외부 컨트랙트를 사용한 예외 처리 

contract Foo {
    address public owner; // 주인 계정을 입력
    constructor(address _owner) { // 생성자를 만들어줌 
        require(_owner != address(0), "invalid address"); // 유효하지 않는 주소 
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function myFunc(uint x) public pure returns (string memory) {
        require(x != 0, "require failed"); // 요구 실페 
        return "my func was called"; //내 함수가 호출됨 
    }
}

contract Bar {
    event Log(string message); 
    event LogBytes(bytes data); 

    Foo public foo; 

    constructor() {
        // This Foo contract is used for example of try catch with external call
        //외부에서 try catch문을 사용하는 예시 
        foo = new Foo(msg.sender); 
    }

    // Example of try / catch with external call
    // tryCatchExternalCall(0) => Log("external call failed") // 실패 
    // tryCatchExternalCall(1) => Log("my func was called") // 성공

    function tryCatchExternalCall(uint _i) public {
        try foo.myFunc(_i) returns (string memory result) {
            emit Log(result); 
        } catch {
            emit Log("external call failed");
        }
    }

    // Example of try / catch with contract creation
    // tryCatchNewContract(0x0000000000000000000000000000000000000000) => Log("invalid address")
    // tryCatchNewContract(0x0000000000000000000000000000000000000001) => LogBytes("")
    // tryCatchNewContract(0x0000000000000000000000000000000000000002) => Log("Foo created")
    function tryCatchNewContract(address _owner) public {
        try new Foo(_owner) returns (Foo foo) {
            // you can use variable foo here
            emit Log("Foo created");
        } catch Error(string memory reason) {
            // catch failing revert() and require()
            emit Log(reason);
        } catch (bytes memory reason) {
            // catch failing assert()
            emit LogBytes(reason);
        }
    }
}
