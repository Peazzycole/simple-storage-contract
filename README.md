# Simple Storage – Foundry Project

A minimal example project for Ethereum smart contract development using [Foundry](https://book.getfoundry.sh/).  
This project demonstrates a simple storage contract, deployment scripts, and comprehensive tests.

---

## Project Structure

```
.
├── src/                  # Solidity contracts
│   └── SimpleStorage.sol
├── script/               # Deployment scripts
│   └── DeploySimpleStorage.s.sol
├── test/                 # Test contracts
│   └── SimpleStorageTest.t.sol
├── broadcast/            # Deployment artifacts
├── cache/                # Build cache
├── lib/                  # External libraries (e.g., forge-std)
├── Makefile              # Common commands
├── foundry.toml          # Foundry configuration
└── README.md
```

---

## Getting Started

### 1. Install Foundry

```sh
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### 2. Install Dependencies

```sh
forge install
```

### 3. Build Contracts

```sh
forge build
```

### 4. Run Tests

```sh
forge test -vvv
```

### 5. Run Coverage

```sh
forge coverage
```

### 6. Deploy Contracts

Deploy to a testnet (e.g., Sepolia):

```sh
forge script script/DeploySimpleStorage.s.sol --broadcast --verify --chain-id 11155111 --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY>
```

Deploy locally (Anvil):

```sh
anvil
make deploy-local
```

---

## Makefile Commands

- `make build` – Build contracts
- `make test` – Run tests
- `make coverage` – Run coverage
- `make deploy` – Deploy to Sepolia
- `make deploy-local` – Deploy to local node
- `make clean` – Clean build artifacts

---

## Scripts

- [`script/DeploySimpleStorage.s.sol`](script/DeploySimpleStorage.s.sol): Script to deploy the SimpleStorage contract.

---

## Testing

Tests are written in Solidity using [forge-std](lib/forge-std/README.md).  
See [`test/SimpleStorageTest.t.sol`](test/SimpleStorageTest.t.sol) for examples.

---

## License

MIT
