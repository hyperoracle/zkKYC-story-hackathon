// SPDX-License-Identifier: UNLICENSED
// See https://github.com/storyprotocol/protocol-contracts/blob/main/StoryProtocol-AlphaTestingAgreement-17942166.3.pdf
pragma solidity ^0.8.19;

import { ShortString, ShortStrings } from "@openzeppelin/contracts/utils/ShortStrings.sol";

/// @notice Library for working with Openzeppelin's ShortString data types.
library ShortStringOps {
    using ShortStrings for *;

    /// @dev Compares whether two ShortStrings are equal.
    function _equal(ShortString a, ShortString b) internal pure returns (bool) {
        return ShortString.unwrap(a) == ShortString.unwrap(b);
    }

    /// @dev Checks whether a ShortString and a regular string are equal.
    function _equal(ShortString a, string memory b) internal pure returns (bool) {
        return _equal(a, b.toShortString());
    }

    /// @dev Checks whether a regular string and a ShortString are equal.
    function _equal(string memory a, ShortString b) internal pure returns (bool) {
        return _equal(a.toShortString(), b);
    }

    /// @dev Checks whether a bytes32 object and ShortString are equal.
    function _equal(bytes32 a, ShortString b) internal pure returns (bool) {
        return a == ShortString.unwrap(b);
    }

    /// @dev Checks whether a string and bytes32 object are equal.
    function _equal(string memory a, bytes32 b) internal pure returns (bool) {
        return _equal(a, ShortString.wrap(b));
    }

    /// @dev Checks whether a bytes32 object and string are equal.
    function _equal(bytes32 a, string memory b) internal pure returns (bool) {
        return _equal(ShortString.wrap(a), b);
    }
}
