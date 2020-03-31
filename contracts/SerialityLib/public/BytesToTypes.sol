pragma solidity ^0.5.0;

import "../BytesToTypes.sol";

contract BytesToTypesPublic {
    using BytesToTypes for bytes;

    function toAddress(bytes memory _input, uint256 _offst)
        public
        pure
        returns (address)
    {
        return _input.toAddress(_offst);
    }

    function toBool(bytes memory _input, uint256 _offst)
        public
        pure
        returns (bool)
    {
        return _input.toBool(_offst);
    }

    function getStringSize(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint256 size)
    {
        return _input.getStringSize(_offst);
    }

    function toString(bytes memory _input, uint256 _offst)
        public
        pure
        returns (bytes memory _output)
    {
        _input.toString(_offst, _output);
        return _output;
    }

    function toBytes32(uint256 _offst, bytes memory _input)
        public
        pure
        returns (bytes32)
    {
        return _input.toBytes32(_offst);
    }

    function toInt8(uint256 _offst, bytes memory _input)
        public
        pure
        returns (int8)
    {
        return _input.toInt8(_offst);
    }

    function toInt16(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int16)
    {
        return _input.toInt16(_offst);
    }

    function toInt24(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int24)
    {
        return _input.toInt24(_offst);
    }

    function toInt32(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int32)
    {
        return _input.toInt32(_offst);
    }

    function toInt40(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int40)
    {
        return _input.toInt40(_offst);
    }

    function toInt48(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int48)
    {
        return _input.toInt48(_offst);
    }

    function toInt56(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int56)
    {
        return _input.toInt56(_offst);
    }

    function toInt64(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int64)
    {
        return _input.toInt64(_offst);
    }

    function toInt72(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int72)
    {
        return _input.toInt72(_offst);
    }

    function toInt80(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int80)
    {
        return _input.toInt80(_offst);
    }

    function toInt88(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int88)
    {
        return _input.toInt88(_offst);
    }

    function toInt96(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int96)
    {
        return _input.toInt96(_offst);
    }

    function toInt104(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int104)
    {
        return _input.toInt104(_offst);
    }

    function toInt112(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int112)
    {
        return _input.toInt112(_offst);
    }

    function toInt120(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int120)
    {
        return _input.toInt120(_offst);
    }

    function toInt128(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int128)
    {
        return _input.toInt128(_offst);
    }

    function toInt136(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int136)
    {
        return _input.toInt136(_offst);
    }

    function toInt144(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int144)
    {
        return _input.toInt144(_offst);
    }

    function toInt152(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int152)
    {
        return _input.toInt152(_offst);
    }

    function toInt160(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int160)
    {
        return _input.toInt160(_offst);
    }

    function toInt168(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int168)
    {
        return _input.toInt168(_offst);
    }

    function toInt176(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int176)
    {
        return _input.toInt176(_offst);
    }

    function toInt184(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int184)
    {
        return _input.toInt184(_offst);
    }

    function toInt192(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int192)
    {
        return _input.toInt192(_offst);
    }

    function toInt200(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int200)
    {
        return _input.toInt200(_offst);
    }

    function toInt208(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int208)
    {
        return _input.toInt208(_offst);
    }

    function toInt216(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int216)
    {
        return _input.toInt216(_offst);
    }

    function toInt224(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int224)
    {
        return _input.toInt224(_offst);
    }

    function toInt232(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int232)
    {
        return _input.toInt232(_offst);
    }

    function toInt240(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int240)
    {
        return _input.toInt240(_offst);
    }

    function toInt248(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int248)
    {
        return _input.toInt248(_offst);
    }

    function toInt256(bytes memory _input, uint256 _offst)
        public
        pure
        returns (int256)
    {
        return _input.toInt256(_offst);
    }

    function toUint8(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint8)
    {
        return _input.toUint8(_offst);
    }

    function toUint16(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint16)
    {
        return _input.toUint16(_offst);
    }

    function toUint24(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint24)
    {
        return _input.toUint24(_offst);
    }

    function toUint32(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint32)
    {
        return _input.toUint32(_offst);
    }

    function toUint40(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint40)
    {
        return _input.toUint40(_offst);
    }

    function toUint48(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint48)
    {
        return _input.toUint48(_offst);
    }

    function toUint56(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint56)
    {
        return _input.toUint56(_offst);
    }

    function toUint64(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint64)
    {
        return _input.toUint64(_offst);
    }

    function toUint72(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint72)
    {
        return _input.toUint72(_offst);
    }

    function toUint80(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint80)
    {
        return _input.toUint80(_offst);
    }

    function toUint88(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint88)
    {
        return _input.toUint88(_offst);
    }

    function toUint96(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint96)
    {
        return _input.toUint96(_offst);
    }

    function toUint104(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint104)
    {
        return _input.toUint104(_offst);
    }

    function toUint112(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint112)
    {
        return _input.toUint112(_offst);
    }

    function toUint120(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint120)
    {
        return _input.toUint120(_offst);
    }

    function toUint128(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint128)
    {
        return _input.toUint128(_offst);
    }

    function toUint136(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint136)
    {
        return _input.toUint136(_offst);
    }

    function toUint144(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint144)
    {
        return _input.toUint144(_offst);
    }

    function toUint152(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint152)
    {
        return _input.toUint152(_offst);
    }

    function toUint160(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint160)
    {
        return _input.toUint160(_offst);
    }

    function toUint168(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint168)
    {
        return _input.toUint168(_offst);
    }

    function toUint176(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint176)
    {
        return _input.toUint176(_offst);
    }

    function toUint184(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint184)
    {
        return _input.toUint184(_offst);
    }

    function toUint192(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint192)
    {
        return _input.toUint192(_offst);
    }

    function toUint200(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint200)
    {
        return _input.toUint200(_offst);
    }

    function toUint208(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint208)
    {
        return _input.toUint208(_offst);
    }

    function toUint216(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint216)
    {
        return _input.toUint216(_offst);
    }

    function toUint224(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint224)
    {
        return _input.toUint224(_offst);
    }

    function toUint232(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint232)
    {
        return _input.toUint232(_offst);
    }

    function toUint240(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint240)
    {
        return _input.toUint240(_offst);
    }

    function toUint248(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint248)
    {
        return _input.toUint248(_offst);
    }

    function toUint256(bytes memory _input, uint256 _offst)
        public
        pure
        returns (uint256)
    {
        return _input.toUint256(_offst);
    }

}
