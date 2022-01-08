pragma solidity >=0.4.16 <0.7.0;

library Search {
    function indexOf(uint256[] storage self, uint256 value)
        public
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < self.length; i++)
            if (self[i] == value) return i;
        return uint256(-1);
    }
}

contract UsingForExample {
    using Search for uint256[];
    uint256[] data;

    function append(uint256 value) public {
        data.push(value);
    }

    function replace(uint256 _old, uint256 _new) public {
        // This performs the library function call uint index = data.indexOf(_old);
        if (index == uint256(-1)) data.push(_new);
        else data[index] = _new;
    }
}
