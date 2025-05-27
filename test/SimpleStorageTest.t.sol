// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeploySimpleStorage} from "../script/DeploySimpleStorage.s.sol";

import {SimpleStorage} from "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage private simpleStorage;

    function setUp() public {
        DeploySimpleStorage deployer = new DeploySimpleStorage();
        simpleStorage = deployer.run();
    }

    function testInitialFavoriteNumberIsZero() public view {
        assertEq(simpleStorage.retrieve(), 0);
    }

    function testStoreAndRetrieveFavoriteNumber() public {
        uint256 newFavoriteNumber = 42;
        simpleStorage.store(newFavoriteNumber);
        assertEq(simpleStorage.retrieve(), newFavoriteNumber);
    }

    function testAddingPersonUpdatesMapping() public {
        string memory name = "Alice";
        uint256 favoriteNumber = 100;

        simpleStorage.addPerson(name, favoriteNumber);

        assertEq(simpleStorage.nameToFavoriteNumber(name), favoriteNumber);
    }

    function testAddingMultiplePeople() public {
        string memory name1 = "Alice";
        uint256 favoriteNumber1 = 100;
        string memory name2 = "Bob";
        uint256 favoriteNumber2 = 200;

        simpleStorage.addPerson(name1, favoriteNumber1);
        simpleStorage.addPerson(name2, favoriteNumber2);

        assertEq(simpleStorage.nameToFavoriteNumber(name1), favoriteNumber1);
        assertEq(simpleStorage.nameToFavoriteNumber(name2), favoriteNumber2);
    }

    function testOverwriteFavoriteNumber() public {
        string memory name = "Alice";
        uint256 initialFavoriteNumber = 100;
        uint256 newFavoriteNumber = 200;

        simpleStorage.addPerson(name, initialFavoriteNumber);
        assertEq(simpleStorage.nameToFavoriteNumber(name), initialFavoriteNumber);

        simpleStorage.addPerson(name, newFavoriteNumber);
        assertEq(simpleStorage.nameToFavoriteNumber(name), newFavoriteNumber);
    }

    function testMappingLengthIsEqualToNumberOfPeopleAdded() public {
        string memory name1 = "Alice";
        uint256 favoriteNumber1 = 100;
        string memory name2 = "Bob";
        uint256 favoriteNumber2 = 200;

        simpleStorage.addPerson(name1, favoriteNumber1);
        simpleStorage.addPerson(name2, favoriteNumber2);

        assertEq(simpleStorage.getListOfPeople().length, 2);
    }
}
