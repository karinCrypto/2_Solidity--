//Random game 코딩하기 

//랜덤 은행 
//참여자 5명: 엘리스(Elice), 밥(Bob),크리스(Chris),데이비드(David),에반(Evan)
/*
//게임 규칙
1) 0.01이더로만 참여 가능
2) 0.01이더초과 또는 0.01이더 미만일 시 트랜잭션 실패가 발생해 게임 참여 불가
3) 한회당 중복 참여 불가 
4) 하나의 계정으로 여러번 게임에 참여해 이득을 취할 수 있으므로 
중복 참여 불가. 우승자가 나오기 전까지 같은 회에서는 
같은 계정의 주소로 게임참여 불가
5) 난수를 갖고 있는 WinnerNumber번째 사람이 우승한다.
6) 매회 변수  WinnerNumber는 무작위로 바뀌며 
WinnerNumber의 값=번째에 참여한 사람이 우승한다.
7) 배포자만 WinnerNumber를 확인할 수 있다. 
8) 일반 참여자가 변수 WinnerNumber를 보고 우승할 수 있으므로 
배포자만 확인할 수 있게한다.(private )*/


// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;


contract Random {
    event paidAddress(address indexed sender, uint256 payment);
    event winnerAddress(address indexed winner);

     modifier onlyOwner() {
        require(msg.sender == owner,"Ownable: caller is not the owner");
        _;
    }
    mapping (uint256=> mapping(address => bool)) public paidAddressList;
    address public owner;
    string private key1;
    uint private key2;
    uint private winnerNumber = 0;
    
    uint public round = 1;
    uint public playNumber = 0; 

    constructor(string memory _key1, uint _key2){
        owner = msg.sender;
        key1 = _key1;
        key2 = _key2;
        winnerNumber = 1; 
    }

     receive() external payable {
        require(msg.value == 10**16, "Must be 0.01 ether.");
        require(paidAddressList[round][msg.sender] == false, "Must be the first time.");
        paidAddressList[round][msg.sender] = true;
        ++playNumber;
         if(playNumber == winnerNumber){
            (bool success,)= msg.sender.call{value:address(this).balance}("");
            require(success, "Failed");
            playNumber = 0;
            ++round;
            winnerNumber = randomNumber();
            emit winnerAddress(msg.sender);
        }else{
            emit paidAddress(msg.sender,msg.value);
        }

}


    function randomNumber() private view returns(uint) {
        uint num = uint(keccak256(abi.encode(key1))) + key2 + (block.timestamp) + (block.number);
        return (num - ((num / 10) * 10))+1;
    }

    function setSecretKey(string memory _key1, uint _key2) public onlyOwner() {
        key1 = _key1;
        key2 = _key2;
    }

    function getSecretKey() public view onlyOwner() returns(string memory, uint){
        return(key1,key2);
    }

    function getWinnerNumber() public view onlyOwner() returns(uint256){
        return winnerNumber;
    }

     function getRound() public view returns(uint256){
        return round;
    }

    function getbalance() public view returns(uint256){
        return address(this).balance;
    } 
}