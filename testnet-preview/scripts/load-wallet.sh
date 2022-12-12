#!/bin/bash

curl -H "content-type: application/json" -XPOST -d @../wallets/Alice.json localhost:8090/v2/wallets
