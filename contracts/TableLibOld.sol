pragma solidity ^0.5.0;

import "./SerialityLib/BytesToTypes.sol";
import "./SerialityLib/TypesToBytes.sol";
import "./SerialityLib/SizeOf.sol";
 
library TableLibOld {
    using BytesToTypes for bytes;
    using SizeOf for string;
    using TypesToBytes for string;
    using TypesToBytes for uint256;
    using TypesToBytes for int256;
    using TypesToBytes for bytes32;

    event EncodeTable(bytes32 indexed _name, bytes _data);
    event LogUInt(uint256 _number);

    struct Table {
        bytes32 name;
        Column[] columns;
        Constraint[] constraints;
        Index[] indexes;
    }

    struct Column {
        bytes32 name;
        bytes32 _dtype;
    }

    struct Constraint {
        bytes32 name;
        bytes32 _type;
    }

    struct Index {
        bytes32 name;
    }

    //WARNING Encoding/Decoding incorrect
    // Use mstore(add(_output, _offst), _input)
    function encode(Table memory _table) internal pure returns (bytes memory) {
        uint256 bufferWords = 1 + 3 + 2 * _table.columns.length + 2 * _table.constraints.length + _table.indexes.length;
        //uint256 offset = 32 * bufferWords;
        bytes32[] memory data = new bytes32[](bufferWords);
        uint256 idx = 0;
        data[idx] = _table.name;
        idx++;
        // Columns
        data[idx] = bytes32(_table.columns.length * 64);
        idx++;
        for (uint256 i = 0; i < _table.columns.length; i++) {
            data[idx] = _table.columns[i].name;
            idx++;
            data[idx] = _table.columns[i]._dtype;
            idx++;
        }
        // Constraints
        data[idx] = bytes32(_table.constraints.length * 64);
        idx++;
        for (uint256 i = 0; i < _table.constraints.length; i++) {
            data[idx] = _table.constraints[i].name;
            idx++;
            data[idx] = _table.constraints[i]._type;
            idx++;
        }
        // Indexes
        data[idx] = bytes32(_table.indexes.length * 32);
        idx++;
        for (uint256 i = 0; i < _table.indexes.length; i++) {
            data[idx] = _table.indexes[i].name;
            idx++;
        }

        bytes memory encoded = abi.encodePacked(data);

        return encoded;
    }

    function decodeTable(bytes memory _bytes) internal pure returns (Table memory) {
        uint256 offset = 0;//_bytes.length;
        Table memory _table;
        _table.name = _bytes.toBytes32(offset);
        offset += 32;

        /*
        uint256 columnsLength = _bytes.toUint256(offset) / 64;
        _table.columns = new Column[](columnsLength);
        offset -= 32;
        for (uint256 i = 0; i < _table.columns.length; i++) {
            Column memory _col;
            _bytes.toBytes32(offset, _col.name);
            offset -= 32;
            _bytes.toBytes32(offset, _col._dtype);
            offset -= 32;
            _table.columns[i] = _col;
        }

        uint256 constraintsLength = _bytes.toUint256(offset) / 64;
        _table.constraints = new Constraint[](constraintsLength);
        offset -= 32;
        for (uint256 i = 0; i < _table.constraints.length; i++) {
            Constraint memory _constraint;
            _bytes.toBytes32(offset, _constraint.name);
            offset -= 32;
            _bytes.toBytes32(offset, _constraint._type);
            offset -= 32;
            _table.constraints[i] = _constraint;
        }

        uint256 indexesLength = _bytes.toUint256(offset) / 32;
        _table.indexes = new Index[](indexesLength);
        offset -= 32;
        for (uint256 i = 0; i < _table.indexes.length; i++) {
            Index memory _index;
            _bytes.toBytes32(offset, _index.name);
            offset -= 32;
            _table.indexes[i] = _index;
        }
        */
        return _table;
        
    }


    /*
    function encode(Column memory _column) internal pure returns (bytes memory) {
        bytes memory buffer = new bytes(64);
        _column.name.toBytes(64, buffer);
        _column._dtype.toBytes(32, buffer);
        return buffer;
    }

    function encode(Constraint memory _constraint) internal pure returns (bytes memory) {
        bytes memory buffer = new bytes(64);
        _constraint.name.toBytes(0, buffer);
        _constraint._type.toBytes(32, buffer);
        return buffer;
    }

    function encode(Index memory _index) internal pure returns (bytes memory) {
        bytes memory buffer = new bytes(32);
        _index.name.toBytes(32, buffer);
        return buffer;
    }
    */
}