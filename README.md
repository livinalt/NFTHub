# NFTHub

NFTHub is a smart contract platform that allows users to mint, buy, and sell NFTs. It supports ERC721 tokens and integrates with ERC20 tokens for payments. Users can mint new NFTs, list them for sale, and transfer ownership through the platform.

## Features

- **Minting NFTs**: Users can mint new NFTs directly.
- **Listing NFTs**: Owners can list their NFTs for sale by setting a price.
- **Buying NFTs**: Users can purchase listed NFTs by paying the listed price in the supported payment token (e.g., USDT or USDC).
- **Ownership Transfer**: The contract allows for ownership transfer of NFTs between users.
- **NFT Information**: Users can check their NFT balance and find the owner of a specific token.

## Smart Contracts

### NFTHub Contract
- **Contract Address**: `0x150f5B84961077Cb080992cDB216387167f2B084`
- [View on Sepolia Lisk Blockscout](https://sepolia-blockscout.lisk.com/address/0x150f5B84961077Cb080992cDB216387167f2B084#code)

### Token Contract (ERC721)
- **Contract Address**: `0x02ad606e51A73A68e987C5cFF626EcDb67E86B44`
- [View on Sepolia Lisk Blockscout](https://sepolia-blockscout.lisk.com/address/0x02ad606e51A73A68e987C5cFF626EcDb67E86B44#code)

## Deployment
Both contracts are deployed on the **Lisk-Sepolia Testnet**.

## How to Interact

1. **Mint an NFT**:
   - Call `mintNFT(tokenId)` to mint an NFT with a specific token ID.
   
2. **List an NFT**:
   - Call `listNFT(tokenId, price)` to list your NFT for sale at a set price.

3. **Buy an NFT**:
   - Call `buyNFT(tokenId)` to purchase a listed NFT. Ensure you have enough of the payment token (e.g., USDT/USDC).

4. **Check NFT Balance**:
   - Call `checkNFTBalance()` to view the number of NFTs in your account.

5. **Check NFT Owner**:
   - Call `checkNFTOwner(tokenId)` to view the owner of a specific NFT.

## Events

- **NFTMinted**: Triggered when an NFT is successfully minted.
- **Listed**: Triggered when an NFT is listed for sale.
- **NFTBought**: Triggered when an NFT is successfully purchased.
- **OwnershipTransferred**: Triggered when the ownership of an NFT is transferred.

## License

This project is licensed under the MIT License.