// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DemoNFT is ERC721, ERC721Enumerable, Ownable {
    uint256 private _nextTokenId;

    constructor(
        address initialOwner
    ) ERC721("DemoNFT", "DNFT") Ownable(initialOwner) {}

    /// @dev the function can be called by anyone
     // Option 1: No return value
    function safeMint(address to) public {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }

    // Option 2: With return value
    // function safeMint(address to) public returns (uint256) {
    //     uint256 tokenId = _nextTokenId++;
    //     _safeMint(to, tokenId);
    //     return tokenId;
    // }

    // The following functions are overrides required by Solidity.

    function _update(
        address to,
        uint256 tokenId,
        address auth
    ) internal override(ERC721, ERC721Enumerable) returns (address) {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(
        address account,
        uint128 value
    ) internal override(ERC721, ERC721Enumerable) {
        super._increaseBalance(account, value);
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
