pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import "@openzeppelin/upgrades/contracts/Initializable.sol";
import "@leovigna/sol-datastructs/src/contracts/PolymorphicDictionaryLib.sol";
import "./structs/TableLib.sol";
import "./structs/ColumnLib.sol";


contract ORMBase is Initializable {
    //Libraries
    using PolymorphicDictionaryLib for PolymorphicDictionaryLib.PolymorphicDictionary;
    using TableLib for TableLib.Table;
    using TableLib for bytes;
    using ColumnLib for ColumnLib.Column;
    using ColumnLib for bytes;

    //Constants
    //schemas
    //bytes32 constant schemas = 0x736368656d617300000000000000000000000000000000000000000000000000;
    //schemas.public
    //bytes32 constant schemasPublic = 0x736368656d61732e7075626c6963000000000000000000000000000000000000;
    //schemas.public.tables
    bytes32 constant schemasPublicTables = 0x736368656d61732e7075626c69632e7461626c65730000000000000000000000;

    //Storage
    PolymorphicDictionaryLib.PolymorphicDictionary internal dictionary;

    //Create default tables
    function initialize() external initializer returns (bool) {
        bool s1 = dictionary.addKey(
            schemasPublicTables,
            PolymorphicDictionaryLib.DictionaryType.OneToManyFixed
        );
        return s1;
    }

    // ****************************** TABLE OPERATIONS ******************************
    function createTable(
        bytes32 _name,
        bytes32[] memory _columnName,
        bytes32[] memory _columnDtype
    ) public returns (bool) {
        TableLib.Table memory table = TableLib.create(
            _name,
            _columnName,
            _columnDtype
        );
        return createTable(table);
    }

    //TO DO name hash
    function createTable(TableLib.Table memory _table) internal returns (bool) {
        //Add definition
        //bytes32 label = keccak256(keccak256(schemasPublicTables), _table.name);
        bool s2 = dictionary.addValueForKey(schemasPublicTables, _table.name);
        bytes memory encoded = _table.encode();
        bool s1 = dictionary.setValueForKey(_table.name, encoded);
        //Add data store key
        //(default fixed)
        //dictionary.addKey(_table, PolymorphicDictionaryLib.DictionaryType.OneToManyFixed);

        return s1 && s2;
    }

    // EXPERIMENTAL
    function getTable(bytes32 _name)
        public
        view
        returns (TableLib.Table memory)
    {
        bytes memory encoded = dictionary.getBytesForKey(_name);
        return encoded.decodeTable();
    }

    // ****************************** DICTIONARY OPERATIONS ******************************
    // ****************************** ENUMERATE OPERATIONS ******************************
    /**
     * @dev Enumerate all dictionary keys. O(n).
     * @return bytes32[] dictionary keys.
     */
    function enumerate() public view returns (bytes32[] memory) {
        return dictionary.enumerate();
    }

    /**
     * @dev Enumerate dictionary keys based on storage type. O(n).
     * @param _type The dictionary type. OneToManyFixed/OneToManyVariable/OneToOneFixed/OneToOneVariable
     * @return bytes32[] dictionary keys.
     */
    function enumerate(PolymorphicDictionaryLib.DictionaryType _type)
        public
        view
        returns (bytes32[] memory)
    {
        return dictionary.enumerate(_type);
    }

    /**
     * @dev Enumerate dictionary set fixed values at dictionary[_key]. O(n).
     * @param _key The bytes32 key.
     * @return bytes32[] values at key.
     */
    function enumerateForKeyOneToManyFixed(bytes32 _key)
        public
        view
        returns (bytes32[] memory)
    {
        return dictionary.enumerateForKeyOneToManyFixed(_key);
    }

    /**
     * @dev Enumerate dictionary set variable values at dictionary[_key]. O(n).
     * @param _key The bytes32 key.
     * @return bytes[] values at key.
     */
    // EXPERIMENTAL
    function enumerateForKeyOneToManyVariable(bytes32 _key)
        public
        view
        returns (bytes[] memory)
    {
        return dictionary.enumerateForKeyOneToManyVariable(_key);
    }

    // ****************************** CONTAINS OPERATIONS ******************************
    /**
     * @dev Check if dictionary contains key. O(1).
     * @param _key The bytes32 key.
     * @return true if key exists.
     */
    function containsKey(bytes32 _key) public view returns (bool) {
        return dictionary.containsKey(_key);
    }

    /**
     * @dev Check if dictionary contains key based on storage type. O(1).
     * @param _key The bytes32 key.
     * @param _type The dictionary type. OneToManyFixed/OneToManyVariable/OneToOneFixed/OneToOneVariable
     * @return true if key exists.
     */
    function containsKey(
        bytes32 _key,
        PolymorphicDictionaryLib.DictionaryType _type
    ) public view returns (bool) {
        return dictionary.containsKey(_key, _type);
    }

    /**
     * @dev Check if dictionary contains fixed value at key. O(1).
     * @param _key The bytes32 key.
     * @param _value The bytes32 value.
     * @return true if value exists at key.
     */
    function containsValueForKey(bytes32 _key, bytes32 _value)
        public
        view
        returns (bool)
    {
        return dictionary.containsValueForKey(_key, _value);
    }

    /**
     * @dev Check if dictionary contains variable value at key. O(1).
     * @param _key The bytes32 key.
     * @param _value The bytes value.
     * @return true if value exists at key.
     */
    function containsValueForKey(bytes32 _key, bytes memory _value)
        public
        view
        returns (bool)
    {
        return dictionary.containsValueForKey(_key, _value);
    }

    // ****************************** LENGTH OPERATIONS ******************************
    /**
     * @dev Get the number of keys in the dictionary. O(1).
     * @return uint256 length.
     */
    function length() public view returns (uint256) {
        return dictionary.length();
    }

    /**
     * @dev Get the number of values at dictionary[_key]. O(1).
     * @param _key The bytes32 key.
     * @return uint256 length.
     */
    function lengthForKey(bytes32 _key) public view returns (uint256) {
        return dictionary.lengthForKey(_key);
    }

    // ****************************** READ OPERATIONS ******************************
    /**
     * @dev Get fixed value at dictionary[_key]. O(1).
     * @param key The bytes32 key.
     * @return bytes32 value.
     */
    function getBytes32ForKey(bytes32 key) public view returns (bytes32) {
        return dictionary.getBytes32ForKey(key);
    }

    /**
     * @dev Get bool value at dictionary[_key]. O(1).
     * @param key The bytes32 key.
     * @return bool value.
     */
    function getBoolForKey(bytes32 key) public view returns (bool) {
        return dictionary.getBoolForKey(key);
    }

    /**
     * @dev Get uint256 value at dictionary[_key]. O(1).
     * @param key The bytes32 key.
     * @return uint256 value.
     */
    function getUInt256ForKey(bytes32 key) public view returns (uint256) {
        return dictionary.getUInt256ForKey(key);
    }

    /**
     * @dev Get int256 value at dictionary[_key]. O(1).
     * @param key The bytes32 key.
     * @return int256 value.
     */
    function getInt256ForKey(bytes32 key) public view returns (int256) {
        return dictionary.getInt256ForKey(key);
    }

    /**
     * @dev Get address value at dictionary[_key]. O(1).
     * @param key The bytes32 key.
     * @return address value.
     */
    function getAddressForKey(bytes32 key) public view returns (address) {
        return dictionary.getAddressForKey(key);
    }

    /**
     * @dev Get variable value at dictionary[_key]. O(1).
     * @param key The bytes32 key.
     * @return bytes value.
     */
    function getBytesForKey(bytes32 key) public view returns (bytes memory) {
        return dictionary.getBytesForKey(key);
    }

    /**
     * @dev Get Bytes32Set value set at dictionary[_key]. O(1).
     * @param key The bytes32 key.
     * @return Bytes32Set value set.
     */
    function getBytes32SetForKey(bytes32 key)
        internal
        view
        returns (Bytes32SetLib.Bytes32Set memory)
    {
        return dictionary.getBytes32SetForKey(key);
    }

    /**
     * @dev Get BytesSet value set at dictionary[_key]. O(1).
     * @param key The bytes32 key.
     * @return BytesSet value set.
     */
    function getBytesSetForKey(bytes32 key)
        internal
        view
        returns (BytesSetLib.BytesSet memory)
    {
        return dictionary.getBytesSetForKey(key);
    }

    /**
     * @dev Get bytes32[] value array at dictionary[key]. O(dictionary[key].length()).
     * @param key The bytes32 key.
     * @return bytes32[] value array.
     */
    function getBytes32ArrayForKey(bytes32 key)
        public
        view
        returns (bytes32[] memory)
    {
        return dictionary.getBytes32ArrayForKey(key);
    }

    /**
     * @dev Get bool[] value array at dictionary[key]. O(dictionary[key].length()).
     * @param key The bytes32 key.
     * @return bool[] value array.
     */
    function getBoolArrayForKey(bytes32 key)
        public
        view
        returns (bool[] memory)
    {
        return dictionary.getBoolArrayForKey(key);
    }

    /**
     * @dev Get uint256[] value array at dictionary[key]. O(dictionary[key].length()).
     * @param key The bytes32 key.
     * @return uint256[] value array.
     */
    function getUIntArrayForKey(bytes32 key)
        public
        view
        returns (uint256[] memory)
    {
        return dictionary.getUIntArrayForKey(key);
    }

    /**
     * @dev Get int256[] value array at dictionary[key]. O(dictionary[key].length()).
     * @param key The bytes32 key.
     * @return int256[] value array.
     */
    function getIntArrayForKey(bytes32 key)
        public
        view
        returns (int256[] memory)
    {
        return dictionary.getIntArrayForKey(key);
    }

    /**
     * @dev Get address[] value array at dictionary[key]. O(dictionary[key].length()).
     * @param key The bytes32 key.
     * @return address[] value array.
     */
    function getAddressArrayForKey(bytes32 key)
        public
        view
        returns (address[] memory)
    {
        return dictionary.getAddressArrayForKey(key);
    }

    // ****************************** WRITE OPERATIONS ******************************
    // ****************************** SET VALUE ******************************
    /**
     * @dev Set fixed value at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The bytes32 value.
     * @return bool true if succeeded (no conflicts).
     */
    function setValueForKey(bytes32 _key, bytes32 _value)
        public
        returns (bool)
    {
        return dictionary.setValueForKey(_key, _value);
    }

    /**
     * @dev Set bool value at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The bool value.
     * @return bool true if succeeded (no conflicts).
     */
    function setBoolForKey(bytes32 _key, bool _value) public returns (bool) {
        dictionary.setBoolForKey(_key, _value);
    }

    /**
     * @dev Set uint value at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The uint value.
     * @return bool true if succeeded (no conflicts).
     */
    function setUIntForKey(bytes32 _key, uint256 _value) public returns (bool) {
        return dictionary.setUIntForKey(_key, _value);
    }

    /**
     * @dev Set int value at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The int value.
     * @return bool true if succeeded (no conflicts).
     */
    function setIntForKey(bytes32 _key, int256 _value) public returns (bool) {
        return dictionary.setIntForKey(_key, _value);
    }

    /**
     * @dev Set address value at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The address value.
     * @return bool true if succeeded (no conflicts).
     */
    function setAddressForKey(bytes32 _key, address _value)
        public
        returns (bool)
    {
        return dictionary.setAddressForKey(_key, _value);
    }

    /**
     * @dev Set variable value at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The bytes value.
     * @return bool true if succeeded (no conflicts).
     */
    function setValueForKey(bytes32 _key, bytes memory _value)
        public
        returns (bool)
    {
        return dictionary.setValueForKey(_key, _value);
    }

    // ****************************** ADD VALUE ******************************
    /**
     * @dev Add fixed value to set at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The bytes32 value.
     * @return bool true if succeeded (no conflicts).
     */
    function addValueForKey(bytes32 _key, bytes32 _value)
        public
        returns (bool)
    {
        return dictionary.addValueForKey(_key, _value);
    }

    /**
     * @dev Add bool value to set at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The bool value.
     * @return bool true if succeeded (no conflicts).
     */
    function addBoolForKey(bytes32 _key, bool _value) public returns (bool) {
        return dictionary.addBoolForKey(_key, _value);
    }

    /**
     * @dev Add uint value to set at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The uint value.
     * @return bool true if succeeded (no conflicts).
     */
    function addUIntForKey(bytes32 _key, uint256 _value) public returns (bool) {
        return dictionary.addUIntForKey(_key, _value);
    }

    /**
     * @dev Add int value to set at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The int value.
     * @return bool true if succeeded (no conflicts).
     */
    function addIntForKey(bytes32 _key, int256 _value) public returns (bool) {
        return dictionary.addIntForKey(_key, _value);
    }

    /**
     * @dev Add address value to set at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The address value.
     * @return bool true if succeeded (no conflicts).
     */
    function addAddressForKey(bytes32 _key, address _value)
        public
        returns (bool)
    {
        return dictionary.addAddressForKey(_key, _value);
    }

    /**
     * @dev Add variable value to set at dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _value The variable value.
     * @return bool true if succeeded (no conflicts).
     */
    function addValueForKey(bytes32 _key, bytes memory _value)
        public
        returns (bool)
    {
        return dictionary.addValueForKey(_key, _value);
    }

    // ****************************** ADD/REMOVE KEYS ******************************
    /**
     * @dev Add key (no value) to dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @param _type The dictionary type. OneToManyFixed/OneToManyVariable/OneToOneFixed/OneToOneVariable
     * @return bool true if succeeded (no conflicts).
     */
    function addKey(bytes32 _key, PolymorphicDictionaryLib.DictionaryType _type)
        public
        returns (bool)
    {
        return dictionary.addKey(_key, _type);
    }

    /**
     * @dev Remove key from dictionary[key]. O(1).
     * @param _key The bytes32 key.
     * @return bool true if succeeded (no conflicts).
     */
    function removeKey(bytes32 _key) public returns (bool) {
        return dictionary.removeKey(_key);
    }

    /**
     * @dev Remove fixed value from set at dictionary[key].
     * @param _key The bytes32 key.
     * @param _value The bytes32 value.
     * @return bool true if succeeded (no conflicts).
     */
    function removeValueForKey(bytes32 _key, bytes32 _value)
        public
        returns (bool)
    {
        return dictionary.removeValueForKey(_key, _value);
    }

    /**
     * @dev Remove variable value from set at dictionary[key].
     * @param _key The bytes32 key.
     * @param _value The bytes value.
     * @return bool true if succeeded (no conflicts).
     */
    function removeValueForKey(bytes32 _key, bytes memory _value)
        public
        returns (bool)
    {
        return dictionary.removeValueForKey(_key, _value);
    }
}
