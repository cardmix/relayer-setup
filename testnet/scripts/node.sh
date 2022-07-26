#!/bin/bash

cardano-node run \
    --config        ../testnet-config.json \
    --topology      ../testnet-topology.json \
    --database-path ../data/db \
    --socket-path   ../node.sock \
    --port          3003
