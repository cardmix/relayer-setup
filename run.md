# Encoins-relay run guide

## Running with tmux

1. Go to ```main/mainnet/wallets``` directory and change default mnemonic sentence to your wallet mnemonic. You can also change the passphrase.

2. Run terminal and move to ```mainnet/scripts``` directory:

```code
cd mainnet/scripts
```

3. Start new tmux session:

```code
tmux new-session -d -s "encoins-relay"
tmux
```

4. Press ```ctrl + b + %``` to split window vertically and run cardano-node:

```tmux
./node.sh
```

5. Press ```ctrl + b + "``` to split window horizontally and run kupo:

```tmux
./kupo.sh
```

6. Press ```ctrl + b + "``` to split window horizontally and run cardano-wallet:

```tmux
./wallet.sh
```

7. After running cardano-wallet split window again, move to wallets directory and load your wallet:

```tmux
cd ../wallets
./load-wallet.sh
```

8. Close this pan with ```ctrl + b x``` when you see message like this:

```code
{"address_pool_gap":20,"assets":{"available":[],"total":[]},"balance":{"available":{"quantity":0,"unit":"lovelace"},"reward":{"quantity":0,"unit":"lovelace"} ...
```

9. Wait until cardano-wallet is fully [synchronized](https://github.com/encryptedcoins/encoins-tools/blob/main/run.md#When-is-cardano-walleet-fully-synchronized?).

10. Now select your first pan with ```ctrl + b q 0```, go to ```../apps/encs``` directory and run encoins-relay:
```tmux
cd ../apps/encs
encoins
```

## Running with single bash command

1. Execute next commands:

```bash
cd mainnet/scripts
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
cd ../apps/encs
tmux select-pane -t 0
tmux send-keys -t $session:$window "cd ../apps/encs" C-m ENTER;
tmux send-keys -t $session:$window "encoins";

tmux attach -t $session;
```

2. Wait until cardano-wallet is fully [synchronized](https://github.com/encryptedcoins/encoins-tools/blob/main/run.md#When-is-cardano-walleet-fully-synchronized?).

3. Press enter.

## When is cardano-walleet fully synchronized?

When you see message like this:

```code
[cardano-wallet.wallet-engine:Notice:42] [current-time]: In sync! Applied n blocks...
```