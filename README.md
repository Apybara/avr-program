# Aleo Validator Registry Program (`av_registry.aleo`)

## Installation / Local Development
### Install `leo`
```
# Download the source code
git clone https://github.com/AleoHQ/leo
cd leo

# Build and install
cargo install --path .
```

## Usage
Now that you have leo, you can run the following
### Call the register_validator function
This function can only be called by the owner of the contract i.e the avr-cli-backend
```
leo run register_validator "{"validator_address":"aleo14yr9gw824yp95fpwfvyq0q5zka088g530chltrsvpsjpusqupgrqlgcu84","name": 123456789123456789123456789123456789123456789field, "website_url": 123456789123456789123456789123456789123456789field, "logo_url": 123456789123456789123456789123456789123456789field}"
```

### Call the update validator function (this can only be called an existing validator)

A more detailed instruction can be found [here](https://apybara.notion.site/AVR-How-to-update-the-validator-registry-a56f080224b348dc9ff320c12439f814)

Only registered validators can call this function. The validator can only update their own information.
```
leo run update_validator "{"validator_address":"aleo14yr9gw824yp95fpwfvyq0q5zka088g530chltrsvpsjpusqupgrqlgcu84","name": 123456789123456789123456789123456789123456789field, "website_url": 123456789123456789123456789123456789123456789field, "logo_url": 123456789123456789123456789123456789123456789field}"
```

## Deployment to Testnet3
[Deploy and Execute](https://developer.aleo.org/testnet/getting_started/deploy_execute)

### Install snarkos
```
git clone https://github.com/AleoHQ/snarkOS.git
cd snarkOS
git checkout testnet3
cargo install --path .
```
### Create new account
```
snarkos account new
```
### Deploy the contract
Make sure the private key owner has enough credit to deploy the contract
```
snarkos developer deploy av_registry.aleo --private-key <PRIVATE_KEY> --query "https://api.explorer.aleo.org/v1" --path "./build" --broadcast "https://api.explorer.aleo.org/v1/testnet3/transaction/broadcast" --priority-fee 0
```

### Register a validator
Can only be called by the owner of the contract i.e the avr-cli-backend `aleo1c43jpf2txe5h839glx47knkg4pupvu5yzkqcg28ynhxqs74npqfqwrg3j9`
```
snarkos developer execute av_registry.aleo register_validator "{"validator_address":"aleo1c43jpf2txe5h839glx47knkg4pupvu5yzkqcg28ynhxqs74npqfqwrg3j9","name": 123456789123456789123456789123456789123456789field, "website_url": 123456789123456789123456789123456789123456789field, "logo_url": 123456789123456789123456789123456789123456789field}" --private-key <PRIVATE_KEY> --query "https://api.explorer.aleo.org/v1" --broadcast "https://api.explorer.aleo.org/v1/testnet3/transaction/broadcast" --priority-fee 0
```

### Update a validator
Can only be called by the owner of the contract i.e the avr-cli-backend
```
snarkos developer execute av_registry.aleo update_validator "{"validator_address":"aleo1rt3vjrusjvd6wje97efl3ra78k0d6f4c3zn8avuym0qwkl4njv9shhmfsk","name": 123456789123456789123456789123456789123456789field, "website_url": 123456789123456789123456789123456789123456789field, "logo_url": 123456789123456789123456789123456789123456789field}" --private-key <PRIVATE_KEY> --query "https://api.explorer.aleo.org/v1" --broadcast "https://api.explorer.aleo.org/v1/testnet3/transaction/broadcast" --priority-fee 0
```

## Author
apybara Engineering Team
