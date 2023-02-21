#!/bin/bash

kupo \
  --node-socket ../node.sock \
  --node-config ../config.json \
  --since origin \
  --match "*/*" \
  --workdir ../data
