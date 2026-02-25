# 🏪 NFT Marketplace — Decentralized Trading Platform

> A Solidity-based NFT marketplace enabling minting, listing, buying, and selling of ERC-721 tokens with integrated ERC-20 payment support.

![Solidity](https://img.shields.io/badge/Solidity-363636?style=flat&logo=solidity&logoColor=white)
![Foundry](https://img.shields.io/badge/Foundry-1C1C1C?style=flat&logo=ethereum&logoColor=white)
![Ethereum](https://img.shields.io/badge/Ethereum-3C3C3D?style=flat&logo=ethereum&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

---

## 📋 Overview

This project implements a full-featured decentralized NFT marketplace where users can:

- **Mint** new ERC-721 NFTs
- **List** NFTs for sale at a custom price
- **Buy** listed NFTs using ERC-20 tokens
- **Sell** NFTs peer-to-peer with secure escrow logic
- Automatic **royalty distribution** and **platform fee** collection

## 🏗️ Architecture

```
├── src/
│   ├── NFTMarketplace.sol      # Core marketplace logic
│   ├── MyNFT.sol               # ERC-721 token contract
│   └── PaymentToken.sol        # ERC-20 payment token
├── test/
│   ├── NFTMarketplace.t.sol    # Marketplace unit tests
│   └── Integration.t.sol       # Integration tests
├── script/
│   └── Deploy.s.sol            # Deployment script
└── foundry.toml
```

## 🔑 Key Features

- **Secure Escrow:** NFTs are held in escrow during listing, preventing double-spending
- **Flexible Payments:** Supports both ERC-20 token payments and native ETH
- **Royalty System:** Configurable royalty percentage for original creators
- **Access Control:** Role-based permissions for admin functions
- **Gas Optimized:** Efficient storage patterns and minimal external calls

## ⚙️ Tech Stack

| Component | Technology |
|-----------|-----------|
| Smart Contracts | Solidity ^0.8.20 |
| Framework | Foundry |
| Token Standards | ERC-721, ERC-20 (OpenZeppelin) |
| Testing | Forge (Foundry) |
| Frontend Interaction | Ethers.js |

## 🚀 Getting Started

### Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation) installed
- Git

### Installation

```bash
# Clone the repository
git clone https://github.com/Sebasduarte14/Market-Place.git
cd Market-Place

# Install dependencies
forge install

# Compile contracts
forge build
```

### Run Tests

```bash
# Run all tests
forge test

# Run with verbosity for detailed output
forge test -vvv

# Run specific test
forge test --match-test testBuyNFT -vvv
```

### Deploy (Local)

```bash
# Start local node
anvil

# Deploy
forge script script/Deploy.s.sol --rpc-url http://localhost:8545 --broadcast
```

## 🧪 Test Coverage

```bash
forge coverage
```

## 📖 Smart Contract Details

### NFTMarketplace.sol

| Function | Description |
|----------|-------------|
| `listNFT()` | List an NFT for sale at a specified price |
| `buyNFT()` | Purchase a listed NFT with ERC-20 tokens |
| `cancelListing()` | Cancel an active listing and return NFT to owner |
| `updatePrice()` | Update the price of an active listing |
| `withdrawFees()` | Admin function to withdraw accumulated platform fees |

## 🔒 Security Considerations

- Reentrancy guards on all state-changing functions
- Checks-Effects-Interactions pattern followed throughout
- OpenZeppelin's audited base contracts used for token standards
- Comprehensive unit tests covering edge cases

## 📄 License

This project is licensed under the MIT License.

---

**Built by [Sebastián Duarte](https://github.com/Sebasduarte14)** — Junior Blockchain Developer
