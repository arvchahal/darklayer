pragma solidity ^0.8.27;
/*
This contact defines the logic for withdrawing and depostiitng form a user on the ethereum L1 layer
to the DarkLayer L2.
*/

contract DarkLayerL1{
    address clientAddr;
    mapping (address => uint) balances;
    function withdraw(uint amount) public payable{
        require (amount > 0 && amount <=balances[msg.sender]);
        balances[msg.sender]-= amount;
        payable(msg.sender).transfer(amount);
    }
    function deposit() public payable{
        require (msg.value > 0 && msg.value <=balances[msg.sender]);
        balances[msg.sender]+=msg.value;
    }
}