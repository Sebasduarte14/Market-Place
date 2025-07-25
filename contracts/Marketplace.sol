// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "./Tokens/ConquerNFT.sol";
import "./Tokens/ConquerERC20.sol";

contract Marketplace is Ownable, ERC721Holder{
    error ConquerNFTMintingError();
    error ConquerMarketplaceInsufficientFunds();
    error ConquerNFTNonAvailable();

    event NFTAddedToMarketplace(uint256 tokenId);
    event NFTPurchased(address to, uint256 tokenId);

    ConquerERC20 public erc20Contract;//Desplegando contratos
    ConquerNFT public nftContract;

    mapping(uint256 tokeId => bool) availableNFTs;

    uint256 public nftPrice;
    uint256 public rewardTokens;

   constructor(uint256 _nftPrice, uint256 _rewardTokens) Ownable(msg.sender) {
    nftContract = new ConquerNFT();
    erc20Contract = new ConquerERC20();

    nftPrice = _nftPrice;
    rewardTokens = _rewardTokens;
   }

   function addNFTToMarketplace() external onlyOwner {
    uint256 tokenId = nftContract.mintConquerNFT(address(this));
    if (tokenId == 0){
        revert ConquerNFTMintingError();
    }
    availableNFTs[tokenId] = true;
    emit NFTAddedToMarketplace(tokenId);

   }

   function buyConquerNFT(uint256 tokenId) external payable {
    if (msg.value < nftPrice) {
        revert ConquerMarketplaceInsufficientFunds();
    }

    if(!availableNFTs[tokenId]){
        revert ConquerNFTNonAvailable();
    }

    availableNFTs[tokenId] = false;
    nftContract.safeTransferFrom(address(this), msg.sender, tokenId);

    erc20Contract.mintConquerERC20(msg.sender, rewardTokens);

    emit NFTPurchased(msg.sender, tokenId);

   }

   function setNftPrice(uint256 _nftPrice) external onlyOwner {
    nftPrice = _nftPrice;
   }

   function setRewardTokens(uint256 _rewardTokens) external onlyOwner {
    rewardTokens = _rewardTokens;
   }

   function withdraw() external onlyOwner {
    payable(owner()).transfer(address(this).balance);
   }

}