pragma solidity ^0.5.0;

import "../SizeOf.sol";


contract SizeOfPublic {
    using SizeOf for string;
    using SizeOf for uint16;

    function sizeOf(string memory _in) public pure  returns (uint _size){
        return _in.size();
    }

    function sizeOfInt(uint16 _postfix) public pure  returns (uint size){
        return _postfix.sizeOfInt();
    }
    
    function sizeOfUint(uint16 _postfix) public pure  returns (uint size){
        return _postfix.sizeOfUint();
    }

    function sizeOfAddress() public pure  returns (uint8){
        return 20; 
    }
    
    function sizeOfBool() public pure  returns(uint8){
        return 1; 
    }
    

}
