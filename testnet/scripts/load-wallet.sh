#!/bin/bash

curl -H "content-type: application/json" -XPOST -d @../wallets/restore-wallet.json localhost:8090/v2/wallets
