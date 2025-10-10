# Protocol Contracts: Programs

This repository hosts the TAGIT L2 program modules that govern transfer, recall, and reward workflows on our OP Stack + EigenDA environment. These contracts emit indexed events that downstream CCIP adapters consume to bridge supply-chain state across domains.

## Repository Layout

- `.codex/` – Codex configuration for build, test, deploy, and post-deploy verification gates.
- `.github/workflows/` – GitHub Actions entry point that calls the organization reusable pipeline.
- `src/` – Solidity sources for program interfaces and implementations.
- `script/` – Foundry broadcast scripts, including the multi-program deployment harness.
- `test/` – Foundry tests providing smoke coverage for program lifecycles.
- `docs/diagrams/` – Architecture diagrams such as [`programs-overview.mmd`](docs/diagrams/programs-overview.mmd).

## Getting Started

1. Install Foundry (`curl -L https://foundry.paradigm.xyz | bash`) and run `foundryup`.
2. Install dependencies and compile:
   ```sh
   forge install
   forge build
   ```
3. Execute the focused program test suite:
   ```sh
   forge test --match-path test/*Programs*.t.sol --gas-report
   ```

## Deployment via Codex

Deployments are orchestrated by Codex using the reusable `use-codex` workflow. Promotion flows follow the `dev → stage → prod` sequence with canary and approval gates as defined in [.codex/Codexfile.yaml](.codex/Codexfile.yaml).

Manual dispatch is available via GitHub Actions or locally with:

```sh
codex deploy --repo protocol-contracts-programs --env <env> --version <git_sha>
codex verify --repo protocol-contracts-programs --env <env> --checks events
```

Refer to the organization runbooks and the reusable workflow documentation for operational guidance on L2 and CCIP integrations.
