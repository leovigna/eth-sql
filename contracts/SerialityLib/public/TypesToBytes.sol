pragma solidity ^0.5.0;

import "../TypesToBytes.sol";

contract TypesToBytesPublic {
    using TypesToBytes for bytes32;
    using TypesToBytes for bool;
    using TypesToBytes for uint256;
    using TypesToBytes for int256;
    using TypesToBytes for address;
    using TypesToBytes for string;
    using TypesToBytes for bytes;

    function toBytes(address _input, uint _offst) public pure returns (bytes memory) {
        bytes memory result = new bytes(_offst);
        _input.toBytes(_offst, result);
        return result;
    }

    function toBytes(uint _offst, bytes32 _input) public pure returns (bytes memory) {
        bytes memory result = new bytes(_offst);
        _input.toBytes(_offst, result);
        return result;
    }
    
    function toBytes(bool _input, uint _offst) public pure returns (bytes memory) {
        bytes memory result = new bytes(_offst);
        _input.toBytes(_offst, result);
        return result;
    }
    
    function toBytes(bytes memory _input, uint _offst) public pure returns (bytes memory) {
        bytes memory result = new bytes(_offst);
        _input.toBytes(_offst, result);
        return result;
    }

    function toBytes(string memory _input, uint _offst) public pure returns (bytes memory) {
        bytes memory result = new bytes(_offst);
        _input.toBytes(_offst, result);
        return result;
    }

    function intToBytes(int _input, uint _offst) public pure returns (bytes memory) {
        bytes memory result = new bytes(_offst);
        _input.toBytes(_offst, result);
        return result;
    }
    
    function uintToBytes(uint _input, uint _offst) public pure returns (bytes memory) {
        bytes memory result = new bytes(_offst);
        _input.toBytes(_offst, result);
        return result;
    }   

}
