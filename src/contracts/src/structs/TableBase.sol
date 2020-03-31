pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import "./TableLib.sol";

contract TableBase {
    using TableLib for TableLib.Table;
    using TableLib for TableLib.Table[];
    using TableLib for bytes;

    // ****************************** SIZE ******************************
    /**
     * @dev TBD
     * @return TBD
     */
    function size(
        TableLib.Table memory _table
    ) public pure returns (uint256) {
        return _table.size();
    }

    /**
     * @dev TBD
     * @return TBD
     */
    function size(
        TableLib.Table[] memory _table
    ) public pure returns (uint256) {
        return _table.size();
    }

    // ****************************** CREATE ******************************
    /**
     * @dev TBD
     * @return TBD
     */
    function create(
        bytes32 _name,
        bytes32[] memory _columnName,
        bytes32[] memory _columnDtype
    ) public pure returns (TableLib.Table memory) {
        return TableLib.create(_name, _columnName, _columnDtype);
    }

    /**
     * @dev TBD
     * @return TBD
     */
    function encode(TableLib.Table memory table) public pure returns (bytes memory) {
        return TableLib.encode(table);
    }

    /**
     * @dev TBD
     * @return TBD
     */
    function encode(
        bytes32 _name,
        bytes32[] memory _columnName,
        bytes32[] memory _columnDtype
    ) public pure returns (bytes memory) {
        TableLib.Table memory table = TableLib.create(_name, _columnName, _columnDtype);
        return TableLib.encode(table);
    }

    // ****************************** DECODE ******************************
    function decodeTable(bytes memory _bytes)
        public
        pure
        returns (TableLib.Table memory)
    {
        return TableLib.decodeTable(_bytes);
    }

    // ****************************** TUPLE ******************************
    /**
     * @dev TBD
     * @return TBD
     */
    function toTuple(TableLib.Table memory _table)
        public
        pure
        returns (
            bytes32 _name,
            bytes32[] memory _columnName,
            bytes32[] memory _columnDtype
        ) {

        return TableLib.toTuple(_table);
    }

}