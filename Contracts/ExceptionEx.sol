pragma solidity 0.6.12;

contract ExceptionExample {
    // uint64 to save gas

    mapping(address => uint64) public balanceReceived;

    function receiveMoney() public payable {
        assert(
            balanceReceived[msg.sender] + uint64(msg.value) >=
                balanceReceived[msg.sender]
        );
        balanceReceived[msg.sender] += uint64(msg.value);
    }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        require(
            _amount <= balanceReceived[msg.sender],
            "You do not have enough ether!"
        );
        {
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        }
    }
}

//remember that errors are state reverting <--- ex: transaction will not happen!
