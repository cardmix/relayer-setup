#!/bin/bash

cd mainnet/scripts
unset GTK_PATH
gnome-terminal --tab --title="kupo" -- bash -c "./kupo.sh"
gnome-terminal --tab --title="cardano-wallet" -- bash -c "./wallet.sh"
gnome-terminal --tab --title="cardano-node" -- bash -c "./node.sh"
cd ../wallets
sleep 10 #Otherwise, the wallet.sh will not have time to initialize if the computer has just been restarted.
./load_wallet.sh
cd ../apps/encs
encoins
