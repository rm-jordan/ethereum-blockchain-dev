pragma solidity ^0.7.2;

// executed using Goerli 5 network (remix.ethereum.org);

// OpenZepplin contract

// as of ^0.8.0 <-- safemath not required, all arithmatic checked by default

import "./Allowance.sol"

import " https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-org/contracts/ownership/Ownable.sol";

contract Allowance is Ownable{

    event AllowanceChanged(address indexed _forWho, address indexed _fromWhom, uint _oldAmount, uint _newAmount);

    mapping (address => uint) public allowance;

    function addAllowance(address _who, uint _amount) public onlyOwner{
        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount); 
        allowance[_who] = _amount;
    }
        function renounceOwnership() public onlyOwner{
            revert ("Cannot renounce ownership!");
        }

    // need to create modifier <-- isOwner from smart contract

    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >=  _amount,"Access denied");
    }
    
    function reduceAllowance(address _who, uint _amount) internal {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who] - _amount)
        allowance[_who] -= _amount;
    }
}


contract SimpleWallet is Allowance{

    event MoneySent(address _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount )


    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
      // reduce allowance functionality
      require(_amount <= address(this).balance, "There are not enough funds stored in contract!");
      if(!isOwner()) {
          reduceAllowance(msg.sender, _amount);
      }

        emit MoneySent(_to, amount);
        _to.transfer(_amount);
    }

    function () external payable {

        emit MoneyReceived(msg.sender, msg.value)

    }
}