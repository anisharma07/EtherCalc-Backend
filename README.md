# EtherCalc-PoC: Collaborative Proposals with Smart Contracts 🚀

EtherCalc-PoC demonstrates how to use EtherCalc spreadsheets 📊 in conjunction with Ethereum smart contracts 🤝 to enable transparent, collaborative, and decentralized decision-making. This project leverages live EtherCalc sheets for off-chain collaboration, while Proposal and ProposalFactory smart contracts ensure on-chain transparency and accountability for actions such as grant distributions, contributions, and open governance.

## ✨ Key Features

- 📝 **Live Collaboration:** Use EtherCalc sheets for real-time, off-chain proposal editing and discussion.
- 🔗 **On-Chain Transparency:** Every proposal is tracked and managed on-chain, ensuring tamper-proof records.
- 🗳️ **Open Decision Making:** Anyone can create and participate in proposals, with voting and results stored on-chain.
- 💸 **Grant & Contribution Management:** Proposals can represent funding rounds, grant distributions, or any collaborative decision.

## 🛠️ Smart Contracts

### `Proposal.sol`

- 📄 Represents a single proposal.
- 🏷️ Stores metadata (name, description, EtherCalc sheet key, start/end time).
- ✅ Tracks votes (`yesVotes`, `noVotes`) and prevents double voting.
- 🧊 Only the owner can freeze a proposal to prevent further changes.

### `ProposalFactory.sol`

- 🏭 Deploys new Proposal contracts using the minimal proxy pattern (EIP-1167) for gas efficiency.
- 📚 Tracks all proposals created.
- 👑 Only the factory owner can perform certain administrative actions.

## 🔗 How EtherCalc Integration Works

- 🔑 Each proposal references an EtherCalc sheet via the `sheetKey` field.
- 🤝 Off-chain, collaborators edit the EtherCalc sheet in real time.
- 🗂️ The sheet key is stored on-chain for transparency and auditability.
- 📝 Decisions and results are finalized and recorded on-chain via the Proposal contract.

## 🚦 Deployment Steps

1. **Clone the Repository**
   ```bash
   git clone <repo-url>
   cd EtherCalc-PoC
   ```

2. **Install Dependencies**
   ```bash
   npm install
   ```

3. **Compile Contracts**
   ```bash
   npx hardhat compile
   ```

4. **Deploy to Sepolia**
   - Ensure your `.env` file is set up with your Sepolia RPC URL and private key.
   - Deploy the contracts:
     ```bash
     npx hardhat run script/deploy.js --network sepolia
     ```

5. **Interact with the Contracts**
   - Use the deployed `ProposalFactory` contract to create new proposals.
   - Each proposal will reference an EtherCalc sheet for off-chain collaboration.
   - Voting and proposal management are handled on-chain.

## 💡 Example Usage

```solidity
// Creating a new proposal (pseudo-code)
ProposalFactory.createProposal(
  Proposal.ProposalInfo({
    startTime: <timestamp>,
    endTime: <timestamp>,
    name: "Grant Round 1",
    description: "Distribute grants for Q1",
    sheetKey: "ethercalc-sheet-key"
  })
);
```

- Collaborators edit the EtherCalc sheet at `https://ethercalc.org/<sheetKey>`.
- Voting is performed on-chain via the Proposal contract.

---

## 📬 Deployed Address

**ProposalFactory deployed on Sepolia:**  
`0x9677EEAf92096fC52c3C4410fb2b2b83e4f9C300`