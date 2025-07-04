// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ETH Splitter
/// @notice Splits incoming ETH between multiple recipients based on percentages
contract EthSplitter {
    /// @notice List of recipient addresses
    address[] public recipients;

    /// @notice Corresponding percentages (out of 100)
    uint256[] public percentages;

    /// @notice Sets recipients and their percentages when deploying the contract
    constructor(address[] memory _recipients, uint256[] memory _percentages) {
        require(_recipients.length == _percentages.length, "Mismatched array lengths");
        uint256 totalPercentage = 0;
        for (uint256 i = 0; i < _recipients.length; i++) {
            recipients.push(_recipients[i]);
            percentages.push(_percentages[i]);
            totalPercentage += _percentages[i];
        }
        require(totalPercentage == 100, "Total percentage must be 100");
    }

    /// @notice Splits received ETH among recipients according to their percentages
    function split() external payable {
        for (uint256 i = 0; i < recipients.length; i++) {
            uint256 amount = (msg.value * percentages[i]) / 100;
            (bool success, ) = recipients[i].call{value: amount}("");
            require(success, "Transfer failed");
        }
    }
}