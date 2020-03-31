pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import "./ColumnLib.sol";

contract ColumnBase {
    using ColumnLib for ColumnLib.Column;
    using ColumnLib for ColumnLib.Column[];
    using ColumnLib for bytes;

    // ****************************** SIZE ******************************
    /**
     * @dev TBD
     * @return TBD
     */
    function size(
        ColumnLib.Column[] memory _column
    ) public pure returns (uint256) {
        return _column.size();
    }

    // ****************************** CREATE ******************************
    /**
     * @dev TBD
     * @return TBD
     */
    function create(
        bytes32 _columnName,
        bytes32 _columnDtype
    ) public pure returns (ColumnLib.Column memory) {
        return ColumnLib.create(_columnName, _columnDtype);
    }

    /**
     * @dev TBD
     * @return TBD
     */
    function createMany(
        bytes32[] memory _columnName,
        bytes32[] memory _columnDtype
    ) public pure returns (ColumnLib.Column[] memory) {
        return ColumnLib.createMany(_columnName, _columnDtype);
    }

    // ****************************** ENCODE ******************************
    /**
     * @dev TBD
     * @return TBD
     */
    function encode(ColumnLib.Column memory _column) public pure returns (bytes memory) {
        return ColumnLib.encode(_column);
    }

    /**
     * @dev TBD
     * @return TBD
     */
    function encodeMany(ColumnLib.Column[] memory _column) public pure returns (bytes memory) {
        return ColumnLib.encodeMany(_column);
    }

    /**
     * @dev TBD
     * @return TBD
     */
    function encodeMany(
        bytes32[] memory _columnName,
        bytes32[] memory _columnDtype) public pure returns (bytes memory) {
        
        ColumnLib.Column[] memory _column = ColumnLib.createMany(_columnName, _columnDtype);
        return ColumnLib.encodeMany(_column);
    }

    /**
     * @dev TBD
     * @return TBD
     */
    function encodeManyWithLength(
        bytes32[] memory _columnName,
        bytes32[] memory _columnDtype) public pure returns (bytes memory) {

        ColumnLib.Column[] memory _column = ColumnLib.createMany(_columnName, _columnDtype);
        bytes memory data = new bytes(size(_column) + 32);
        ColumnLib.encodeMany(_column, data.length, data);
        return data;
    }

    // ****************************** DECODE ******************************
    /**
     * @dev TBD
     * @return TBD
     */
    function decodeColumn(bytes memory _bytes)
        public
        pure
        returns (ColumnLib.Column memory)
    {
        return ColumnLib.decodeColumn(_bytes);
    }

    /**
     * @dev TBD
     * @return TBD
     */
    function decodeColumnMany(bytes memory _bytes) public pure returns (ColumnLib.Column[] memory) {
        return ColumnLib.decodeColumnMany(_bytes);
    }

    /**
     * @dev TBD
     * @return TBD
     */
    function decodeColumnManyWithLength(bytes memory _bytes) public pure returns (ColumnLib.Column[] memory, uint256) {
        return ColumnLib.decodeColumnMany(_bytes, _bytes.length);
    }


    // ****************************** TUPLE ******************************
    /**
     * @dev TBD
     * @return TBD
     */
    function toTuple(ColumnLib.Column memory _column)
        public
        pure
        returns (
            bytes32 _columnName,
            bytes32 _columnDtype
        ) {
        return ColumnLib.toTuple(_column);
    }

    /**
     * @dev TBD
     * @return TBD
     */
    function toTupleMany(ColumnLib.Column[] memory _column)
        public
        pure
        returns (
            bytes32[] memory _columnName,
            bytes32[] memory _columnDtype
        ) {

        return ColumnLib.toTupleMany(_column);
    }

}