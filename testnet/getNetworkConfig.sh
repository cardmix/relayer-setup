#!/bin/bash
NODE_CONFIG=testnet
wget -N https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/${NODE_CONFIG}-config.json
wget -N https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/${NODE_CONFIG}-byron-genesis.json
wget -N https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/${NODE_CONFIG}-shelley-genesis.json
wget -N https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/${NODE_CONFIG}-alonzo-genesis.json
wget -N https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/${NODE_CONFIG}-topology.json
