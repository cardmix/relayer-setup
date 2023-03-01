# ENCOINS Tools
A suite of scripts and config files to run ENCOINS backend applications.

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

* ENCS Distribution App requires a blockfrost token to run. You can get a free token at by registering at https://blockfrost.io/. Write you token in quotes in the "blockfrost.token" file inside "mainnet/apps/encs" folder (see "blockfrost.token.example" there).
