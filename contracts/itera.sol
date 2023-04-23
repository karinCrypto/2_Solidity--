// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Array {
    // 배열을 초기화하는 여러 가지 방법
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];

    // 고정 크기 어레이, 모든 요소가 0으로 초기화됨 
   uint[10] public myFixedSizeArr;

   function get(uint i) public view returns (uint) { 
        return arr[i]; //배열 나열된 임의 값 
    } 

    //솔리디티 전체 배열 반환이 가능. 무한한 배열 확장이 가능
     function getArr() public view returns (uint[] memory) { 
        return arr; 
    } 

       function push(uint i) public { 
       // 배열에 추가: 이렇게 하면 배열 길이가 1만큼 늘어납니다. 
        arr.push(i); 
    } 

     
    function pop() public { 
       // 배열에서 마지막 요소 제거: 이렇게 하면 배열 길이가 1 감소합니다 
        arr.pop(); 
    } 

    function getLength() public view returns (uint) { 
        return arr.length; //길이값
    } 

     function remove(uint index) public { 

        // 삭제해도 배열 길이는 변경되지 않습니다. 
        // 인덱스의 값을 기본값으로 재설정합니다, 
        // 이 경우 0 
       delete arr[index]; 
    } 
    function examples() external { 

       // 메모리에 어레이 생성, 고정 크기만 생성할 수 있습니다 
        uint[] memory a = new uint[](5); 

    } 

} 