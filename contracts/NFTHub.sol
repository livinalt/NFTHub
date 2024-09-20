// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

import "./Token.sol";

contract NFTHub{

    Token public nftToken;

    address public paymentToken;  // could be usdt, usdc etc...

    address public owner;

    event NFTMinted(address indexed minter, uint256 indexed tokenId);
    event Listed(uint256 indexed _tokenId, address indexed owner, uint256 indexed _price, bool);
    event NFTBought(address indexed from, address indexed to, uint256 indexed _tokenId);
    event OwnershipTransfered(address indexed owner, address indexed newOwner, uint256 indexed _tokenId);

 struct ListedNFT{
    uint256 tokenId;
    address owner;
    uint256 price;
    bool isListed;
 }

 ListedNFT[] public allListedNFT;

 ListedNFT nftsListed;

 mapping(uint256 => ListedNFT) public ListedNftId;



constructor( address _paymentToken){
    owner = msg.sender;
    paymentToken = _paymentToken;
   
}

modifier onlyOwner(){
    require(msg.sender == owner,"Not Only");
    _;
}
 
// for the user to mint an already existing nft 
 function mintNFT(uint256 tokenId) public {
        require(msg.sender != address(0), "Address Zero Detected");
        require(tokenId != 0, "Invalid token Id");
        nftToken.safeMint(msg.sender, tokenId);

        emit NFTMinted(msg.sender, tokenId);

 }

 function listNFT(uint256 _tokenId, uint256 _price) external onlyOwner{
        require(_price != 0, "Address Zero Detected");
        require(_tokenId != 0, "Invalid token Id");

        ListedNFT storage nft = ListedNftId[_tokenId];
        nft.tokenId = _tokenId;
        nft.owner = msg.sender;
        nft.price = _price;
        nft.isListed = true;

        allListedNFT.push(nft);

        emit Listed(_tokenId, msg.sender, _price, true);

 }
// buy involves transfereing ownership from one owner to another
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

        emit NFTBought(address(this), msg.sender, _tokenId);

 }

 
// this transfers ownership of a token from one user to another
 function transferOwnership(uint256 _tokenId) external onlyOwner{

    ListedNFT memory nft = ListedNftId[_tokenId];

    nftToken.safeTransferFrom(nft.owner, msg.sender, _tokenId);

    emit OwnershipTransfered(nft.owner, msg.sender, _tokenId);

 }

 function checkNFTBalance() external view returns(uint256){
    return nftToken.balanceOf(msg.sender);
    
 }

 function checkNFTOwner(uint256 _tokenId) external view returns(address){
        ListedNFT memory nft = ListedNftId[_tokenId];
        return nft.owner;
 }

}