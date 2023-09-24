# ENCOINS Tools
A suite of scripts and config files to run the ENCOINS backend applications.

# Installation
In order to setup all the necessary applications for encoins-relay, consult the installation guide [here](https://github.com/encryptedcoins/encoins-tools/blob/main/INSTALL.md). The guide has been tested on a clean Ubuntu 22.04.3 LTS with the mininimal installation option.

# Run
* Make changes to the config files if necessary.
* [Add your wallet](https://github.com/encryptedcoins/encoins-tools#cardano-wallet)
* Launch the [run.sh](https://github.com/encryptedcoins/encoins-tools/blob/main/run.sh) script or use the guide [here](https://github.com/encryptedcoins/encoins-tools/blob/main/RUN.md).
* After executing ```encoins run```, make sure that port 3000 is accessible from the outside. You can test port accessibility [here](https://www.yougetsignal.com/tools/open-ports/).

# Notes

## cardano-node

* Use `./getNetworkConfig.sh` to download the latest default config files for the cardano-node.
* When node is synchronized and running, use `./getProtocolParameters.sh` to download the current protocol parameters in JSON format.
* To start a cardano-node with the default parameters, go to "scripts" folder and run `./node.sh`.

## cardano-wallet

* Backend wallets are stored in the "wallets" folder. Change the `mnemonic_senstence` in the "wallet-example.json" file to the seed phrase of your backend wallet and save it as "wallet.json".
* To start a cardano-wallet app, go to "scripts" folder and run `./wallet.sh`.

IMPORTANT: it is strongly recommended not to store large amounts of crypto in such backend wallets.

## encs

* Verifying distribution results requires a Blockfrost token to run. You can get a free token at by registering at https://blockfrost.io/. Write you token in quotes in the "blockfrost.token" file inside "mainnet/apps/encs" folder (see "blockfrost.token.example" there).
