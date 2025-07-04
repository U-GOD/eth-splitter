# ETH Splitter Contract

This Solidity smart contract allows users to **automatically split any sent ETH among multiple recipients** based on specified percentages.

## ✨ Features

- **Automatic Distribution:** When you call `split()` and send ETH, the contract splits the funds proportionally between all recipients.
- **Immutable Recipients and Percentages:** The recipients and their split percentages are set once at deployment and cannot be changed.
- **Transparency:** Anyone can view the configured recipients and their share percentages.

## 🛠 How It Works

1. **Deploy the Contract:**
   - Provide:
     - An array of recipient addresses.
     - An array of percentages corresponding to each recipient.
   - The sum of percentages must be **100**.

2. **Split ETH:**
   - Call `split()` and send any amount of ETH.
   - The contract will automatically distribute the ETH to the recipients based on their percentages.

## 📝 Example

If you deploy with:
- Recipients: `[Alice, Bob]`
- Percentages: `[70, 30]`

Sending `1 ETH` to `split()` will:
- Transfer `0.7 ETH` to Alice.
- Transfer `0.3 ETH` to Bob.

## 🔒 Security Considerations

- Always verify that percentages sum to exactly 100 to avoid deployment errors.
- This contract does **not** include an owner or admin function. Once deployed, the recipient and split configuration are fixed.

## 📄 License

MIT
