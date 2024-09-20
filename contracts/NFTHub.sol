// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

import "./Token.sol";

contract NFTHub{

    Token public nftToken;

    address public owner;
    ERC721 public nftContractAddress; // this is the address that you want to mint

/* 
this contract is an nft marketplace where users can mint buy and sell nfts. 
users can also list
 */

 // 3. mint the nft for sale
 // 2. the struct for list nft - price, nft id, 
 // 1. list the nft for sale ---we can have an array of listed nfts or mapping
 // 4. buy the nft 
 // 5. transfer ownership of the nft 
 // 6. mint the nft for sale


 struct ListedNFT{
    uint256 tokenId;
    address owner;
    uint256 price;
    bool isListed;
 }

 ListedNFT[] public allListedNFT;

 ListedNFT nftsListed;

 mapping(uint256 => ListedNFT) public ListedNftId;



constructor(){
    owner = msg.sender;
   
}
 
// for the user to mint an already existing nft 
 function mintNFT(uint256 tokenId) public {
        require(msg.sender != address(0), "Address Zero Detected");
        require(tokenId != 0, "Invalid token Id");
        nftToken.safeMint(msg.sender, tokenId);

 }

 function listNFT(uint256 _tokenId, uint256 _price) external{
        require(_price != 0, "Address Zero Detected");
        require(_tokenId != 0, "Invalid token Id");

        ListedNFT storage nft = ListedNftId[_tokenId];

            nft.tokenId = _tokenId;
            nft.owner = msg.sender;
            nft.price = _price;
            nft.isListed = true;

        allListedNFT.push(nft);

 }

function buyNFT(uint256 _tokenId) external payable{

        require(_tokenId != 0, "Invalid token Id");
        require(msg.sender != address(0), "Address Zero Detected");
        require(paymentToken != address(0), "Address Zero Detected");
        require(address(this) != address(0), "Address Zero Detected");

        ListedNFT storage nft = ListedNftId[_tokenId];

        require(IERC20(paymentToken).balanceOf(msg.sender) >= nft.price, "insufficient price");

        IERC20(paymentToken).transferFrom(msg.sender, nft.owner, nft.price);

        nftToken.safeTransferFrom(address(this), msg.sender, _tokenId);

        nft.isListed = false;
        nft.owner = msg.sender;

 }

 function transferOwnership() external {

 }

 function checkNFTBalance() external{

 }




}