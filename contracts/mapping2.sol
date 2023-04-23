// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

//매핑

contract mapping2{
    mapping (address => bool) public myAddressbBoolMapping;

    function writeBoolMapping (address _address, bool _bool) public{
        myAddressbBoolMapping[_address] = _bool;
    }

    function writeBoolMapping (bool _bool) public{
        myAddressbBoolMapping [msg.sender] = _bool;
    }


    mapping (address => uint) public myBalanceAdress;

    function depositMapping() public payable{
       myBalanceAdress[msg.sender] += msg.value;
    }

    function withdrawMapping(address payable _to, uint _amount) public {
        if(myBalanceAdress[msg.sender] >= _amount){
            myBalanceAdress[msg.sender] -=  _amount;
            _to.transfer(_amount);
        }
    }


}