# ENCOINS Tools
A suite of scripts and config files to run ENCOINS backend applications.

# Setup
Setup script have been tested on clean Ubuntu 22.04.3 LTS with mininimal installation option. 
In order to get all the applications necessary for encoins-relay, run the [setup.sh](https://github.com/encryptedcoins/encoins-tools/blob/main/setup.sh) script. Wait for cardano-node, cardano-wallet and kupo to fully sync.

# Run
* Make changes to the config files if necessary.
* [Add your wallet](https://github.com/encryptedcoins/encoins-tools#cardano-wallet)
* Launch [run.sh](https://github.com/encryptedcoins/encoins-tools/blob/main/run.sh) script.

# Notes

## cardano-node

* Use `./getNetworkConfig.sh` to download the latest default config files for the cardano-node.
* When node is synchronized and running, use `./getProtocolParameters.sh` to download the current protocol parameters in JSON format.
* To start a cardano-node with the default parameters, go to "scripts" folder and run `./node.sh`.

## cardano-wallet

* Backend wallets are stored in the "wallets" folder. Change the `mnemonic_senstence` in the "wallet.json" file to the seed phrase of your backend wallet.
* To start a cardano-wallet app, go to "scripts" folder and run `./wallet.sh`.

IMPORTANT: it is strongly recommended not to store large amounts of crypto in such backend wallets.

## encs

* Verifying distribution results requires a Blockfrost token to run. You can get a free token at by registering at https://blockfrost.io/. Write you token in quotes in the "blockfrost.token" file inside "mainnet/apps/encs" folder (see "blockfrost.token.example" there).
