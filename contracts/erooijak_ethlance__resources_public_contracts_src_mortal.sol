pragma solidity ^0.4.8;

import "Ownable.sol";

contract Mortal is Ownable {
    function kill() {
        if (msg.sender == owner)
            selfdestruct(owner);
    }
}
