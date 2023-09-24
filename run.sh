#!/bin/bash

cd testnet-preprod/scripts
session="encoins-relay";
tmux new-session -d -s $session;
window=0;

# Node
tmux split-window -h;
tmux send-keys -t $session:$window "./node.sh" C-m ENTER;

# Kupo
tmux split-window -v;
tmux send-keys -t $session:$window "./kupo.sh" C-m ENTER;

# Wallet
tmux split-window -v -p 50;
tmux send-keys -t $session:$window "./wallet.sh" C-m ENTER;

# Load wallet
cd ../wallets
tmux split-window -v;
tmux send-keys -t $session:$window "sleep 10" C-m ENTER;
tmux send-keys -t $session:$window "./load_wallet.sh" C-m ENTER;
tmux send-keys -t $session:$window "sleep 10" C-m ENTER;
tmux send-keys -t $session:$window "tmux kill-pane -t 4" C-m ENTER;

# Relay
cd ../apps/encoins
tmux select-pane -t 0
tmux send-keys -t $session:$window "cd ../apps/encoins" C-m ENTER;
tmux send-keys -t $session:$window "encoins run";

tmux attach -t $session;
