//try catch함수 

// 3개의 이벤트 
// Output5 함수 
// output5WithTryCatch 함수 

//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Error_1{

    event ErrorReason1(string reason); 
    event ErrorReason2(uint errorCode);
    event ErrorReason3(bytes lowLevelData);

    function output5(uint _num) public pure returns(uint) { 
        if(_num>=6) { // 6이상일 경우에 f(오류 메시지 출력) or 6미만일 경우에 t
            revert("_num should be 5");
        }
        if(_num<=4){ //4이하일 경우에 f출력 assert 오류 발생 
            assert(false);
        }
        return 5; //5를 리턴함
    }
    //catch erro r= revert require 
    //catchpanic = assert, panic형 오류는 10개다. (ppt에 있는 오류코드) 0x01오류코드 예상 


    function output5WithTryCatch(uint _num) public returns(uint256, bool) {
        
        try this.output5(_num) returns (uint256 value) {
            return(value, true);
        } catch Error(string memory reason) {
            emit ErrorReason1(reason);
            return(0, false);

        } catch Panic(uint errorCode) {
            emit ErrorReason2(errorCode);
            return(0, false);
            
        } catch (bytes memory lowLevelData) {
            emit ErrorReason3(lowLevelData);
            return(0, false);
        }
    }
}