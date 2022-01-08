pragma solidity ^0.5.13;



contract StartStopUpdateExample {

    address owner;

    bool public paused; //intially false

    constructor() public {
        owner = msg.sender;
    }

    function sendMoney() public payable {


    }

    function setPaused(bool _paused) public {
        // for owner of contract only <---
        require(msg.sender == owner, "You are not the owner!")
        paused = _paused;
    }

    function withdrawAllMoney(address payable _to) public {
        // if else statement would be used in other languages
        require(msg.sender == owner, "You are not the owner, withdraw prohibited!");
        require(!paused, "Contract is paused");
        _to.transfer(address(this).balance);
    }
    
    function destroySmartContract(address payable _to) public {
        // call solidity internal function called selfdestruct
        require(msg.sender == owner, "Contact intact, you are not the owner!")
        selfdestruct(_to);
    }
}