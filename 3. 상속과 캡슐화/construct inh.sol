// 생성자가 있는 부모 스마트 컨트랙트

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Student {
    string public schoolName = "The University of Solidity";
    string public major; //전공 
    constructor(string memory _major) { // 생성자 = 전공에 대한 문자열 매개변수를 받는 생성자
        major = _major;
    }
}

contract ArtStudent is Student("Art") {
    
}

contract MusicStudent is Student {
    string internal degree = "Music"; //학위를 음악 
    constructor() Student(degree){
    }
}

contract MathStudent is Student{
    constructor(string memory _major) Student(_major){
    }
}
