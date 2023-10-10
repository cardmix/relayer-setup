#!/bin/bash

node_metrics_port=12798
kupo_port=1442
relay_port=$(jq -r '.port' ../apps/encoins/config.json)
relay_host=$(jq -r '.host' ../apps/encoins/config.json)

connErr="ConnectionError"
check_service()
{
    if [[ $1 == "$connErr" ]]; then
        echo "$2 is offline."
    else
        echo "$2 is Ok."
    fi
}

node_check=$(curl "localhost:${node_metrics_port}/metrics") || node_check=$connErr
kupo_check=$(curl "localhost:${kupo_port}/health") || kupo_check=$connErr
wallet_check=$(cardano-wallet network information) || wallet_check=$connErr
relay_check=$(curl "${relay_host}:${relay_port}/ping") || relay_check=$connErr

check_service "$node_check" "Cardano-node"
check_service "$kupo_check" "Kupo"
check_service "$wallet_check" "Cardano-wallet"
check_service "$relay_check" "Encoins-relay"
