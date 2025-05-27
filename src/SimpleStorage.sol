// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/**
 * @title SimpleStorage
 * @dev A simple contract to store a favorite number and manage a list of people with their favorite numbers.
 * This contract allows users to store a number, retrieve it, and add people with their favorite numbers.
 * It also maintains a mapping from names to favorite numbers.
 * @author Peace Oghenevwefe
 * @notice This contract is for educational purposes and demonstrates basic Solidity concepts.
 */
contract SimpleStorage {
    uint256 private s_myFavoriteNumber; // 0
    Person[] private s_listOfPeople;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        s_myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return s_myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        s_listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    function getListOfPeople() public view returns (Person[] memory) {
        return s_listOfPeople;
    }
}
