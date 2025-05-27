-include .env

.PHONY: all test coverage build deploy deploy-local clean

test:
	forge test -vvv

coverage:
	forge coverage

build:
	forge build

deploy:
	forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage --rpc-url http://127.0.0.1:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast

clean:
	forge clean
