#!/bin/bash

curl -H "content-type: application/json" -XPOST -d @ENCS-Test-Backend.json localhost:8090/v2/wallets
