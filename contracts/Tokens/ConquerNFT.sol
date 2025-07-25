// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract ConquerNFT is ERC721, Ownable{
    uint256 _tokenId;

    constructor() ERC721("Conquer NFT Collection", "CNFT") Ownable(msg.sender){
        _tokenId = 0;
    }

    function mintConquerNFT(address to) external onlyOwner returns(uint256) {
        _tokenId = _tokenId+1;
        _safeMint(to, _tokenId);
        return _tokenId;
    }



}