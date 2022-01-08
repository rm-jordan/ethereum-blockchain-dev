pragma solidity ^0.6.0;

contract SimpleMappingExample {

    // bool myVar1 = false;
    // bool myVar2 = false;
    // bool myVar3 = false;

    // mapping( => ...)myMapping;
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping(uint => bool)) uintUintBoolMapping;

    function setUintUintBoolMapping(uint _index1, uint _index2, bool _value) public {
        uintUintBoolMapping[_index1][_index2] = _value
    }




    function setValue(unit _index) public {
        myMapping[_index] = true;
    }

    // function setMyVar1ToTrue() public {
    //     myVar1 = true;
    // } <-- done to test mapping, can be used on addresses

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

}