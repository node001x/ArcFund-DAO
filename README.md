# ArcFund DAO

A decentralized crowdfunding platform built on Ethereum that enables creators to launch fundraising campaigns and receive community support directly on-chain.

## Features

* Create crowdfunding campaigns
* Donate ETH to campaigns
* Automatic NFT supporter badge minting
* DAO governance module
* Campaign goal tracking
* Creator fund withdrawal
* Hardhat testing suite
* MetaMask integration
* Ethers.js frontend integration

---

## Tech Stack

### Smart Contracts

* Solidity 0.8.20
* OpenZeppelin Contracts

### Development

* Hardhat
* Ethers.js
* Node.js

### Frontend

* HTML
* CSS
* JavaScript
* MetaMask

---

## Project Structure

```text
arcfund-dao/

contracts/
├── ArcFund.sol
├── DAOManager.sol
├── SupporterNFT.sol
└── interfaces/
    └── ISupporterNFT.sol

frontend/
├── index.html
├── app.js
├── wallet.js
├── config.js
└── style.css

scripts/
├── deploy.js
└── verify.js

test/
├── ArcFund.test.js
├── DAOManager.test.js
└── SupporterNFT.test.js

hardhat.config.js
package.json
.env.example
README.md
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/your-username/arcfund-dao.git

cd arcfund-dao
```

Install dependencies:

```bash
npm install
```

---

## Environment Variables

Create a `.env` file:

```env
RPC_URL=https://sepolia.infura.io/v3/YOUR_KEY

PRIVATE_KEY=YOUR_PRIVATE_KEY

ETHERSCAN_KEY=YOUR_ETHERSCAN_API_KEY

NFT_ADDRESS=

ARCFUND_ADDRESS=
```

---

## Compile Contracts

```bash
npx hardhat compile
```

---

## Run Tests

```bash
npx hardhat test
```

---

## Deploy Contracts

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

After deployment:

1. Copy NFT contract address.
2. Copy ArcFund contract address.
3. Update frontend/config.js.
4. Call:

```solidity
setCrowdfundingContract(
    arcfundAddress
)
```

on the NFT contract.

---

## Verify Contracts

```bash
npx hardhat run scripts/verify.js --network sepolia
```

---

## Running Frontend

Open:

```text
frontend/index.html
```

or use VS Code Live Server:

```bash
Right Click -> Open With Live Server
```

Connect MetaMask and interact with the DApp.

---

## Smart Contracts

### ArcFund.sol

Handles:

* Campaign creation
* Donations
* Fund withdrawals
* Contribution tracking

### SupporterNFT.sol

Handles:

* NFT supporter badges
* Automatic minting for donors

### DAOManager.sol

Handles:

* DAO membership
* Proposal creation
* Community voting

---

## User Flow

### Campaign Creator

1. Connect wallet
2. Create campaign
3. Set funding goal
4. Receive donations
5. Withdraw after goal is reached

### Supporter

1. Connect wallet
2. Browse campaigns
3. Donate ETH
4. Receive supporter NFT

### DAO Member

1. Join DAO
2. Vote on proposals
3. Participate in governance

---

## Security Notes

This project is intended for educational and demonstration purposes.

Before deploying to mainnet:

* Add ReentrancyGuard
* Add Pausable functionality
* Add access control improvements
* Add withdrawal governance checks
* Perform professional smart contract audit
* Add multisig treasury controls

---

## Future Improvements

* ERC20 donation support
* Campaign categories
* Campaign images stored on IPFS
* On-chain governance integration
* Snapshot voting
* Multi-chain deployment
* Revenue sharing mechanisms
* Milestone-based fund releases

---

## License

MIT License

Copyright (c) 2026 ArcFund DAO

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files to deal in the Software without restriction.
