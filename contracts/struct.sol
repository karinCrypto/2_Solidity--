// SPDX-License-Identifier: GPL-3.0
//구조체 
pragma solidity >=0.7.0 <0.9.0;

 contract Struct{
     
    struct Car{
        string model;//모델명
        uint year; // 몇년산 
        address owner;// 주인 주소값
    }
    Car public car;
    Car[] public cars;//배열
    mapping(address => Car[]) public carsByOwner; 

    function examples() external {
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        Car memory gia = Car("gia", 1997, msg.sender);
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2018;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(gia);
        cars.push(tesla);

        cars.push(Car("Ferrari",2007, msg.sender));

        Car storage _car = cars[0]; 
        // 'memory'를 사용하면 fn이 반환된 후 수정 사항이 저장되지 않습니다
        _car.year = 1999;
        delete cars[1];
         // 'calldata'는 읽기 전용이지만 내부 fns로 전달하는 GAS b/c를 저장할 수 있으며, 다시 복사되지 않습니다
    }
 }
