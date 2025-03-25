# 🗳️ Voting App

A decentralized voting system built with Solidity and Foundry, allowing users to vote securely on the blockchain. 

## 🚀 Features
- 🏛️ **Add Candidates** – Only the contract owner can add candidates.
- ✅ **Voting System** – Users can cast their votes only once.
- 📊 **Results Calculation** – Automatically determines the winner based on votes.
- 🔒 **Secure & Transparent** – Powered by Ethereum smart contracts.

📌 Usage
1️⃣ Add a Candidate

solidity
Copy
Edit
voting.addCandidate("Alice");
2️⃣ Vote for a Candidate

solidity
Copy
Edit
voting.vote(0); // Voting for candidate at index 0
3️⃣ Check Voting Results

solidity
Copy
Edit
(string memory winner, uint256 votes) = voting.getWinner();
🤝 Contributing
Feel free to contribute! Open an issue or submit a pull request. 🚀

📜 License
This project is licensed under the MIT License.

