// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract StateSender {
    uint256 public constant DATA_LENGTH = 30000;
    uint256 public counter;

    event StateSynced(
        uint256 indexed id,
        address indexed sender,
        address indexed contractAddress,
        bytes data
    );

    /**
    * 
    * @param receiver Receiver address on Polygon chain
    * @param data Data to send on Polygon chain
    */
    function syncState(address receiver, bytes calldata data) external {
        // check data length
        require(data.length >= DATA_LENGTH, "Unsupported data length");

        counter = counter + 1;
        emit StateSynced(counter, msg.sender, receiver, data);
    }
}
