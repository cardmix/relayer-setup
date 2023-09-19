#!/bin/bash

mkdir -p "$HOME/.local/bin/"
if [[ ! -d "$PATH" ]]; then
    export PATH="$HOME/.local/bin/:$PATH"
    echo "export PATH='$HOME/.local/bin/:$PATH'" >> ~/.bashrc
fi

#utils
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install automake build-essential curl pkg-config libffi-dev libgmp-dev libssl-dev libtinfo-dev libsystemd-dev zlib1g-dev make g++ tmux git jq wget libtool autoconf libpq-dev -y

mkdir -p cardano-src
cd cardano-src

#libsodium
git clone https://github.com/input-output-hk/libsodium
cd libsodium
git checkout dbb48cc
./autogen.sh
./configure
make
sudo make install

if [[ ! -d $LD_LIBRARY_PATH ]]; then
    export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
    echo "export LD_LIBRARY_PATH='/usr/local/lib:$LD_LIBRARY_PATH'" >> ~/.bashrc
fi

if [[ ! -d "$PKG_CONFIG_PATH" ]]; then
    export PKG_CONFIG_PATH="usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
    echo "export PKG_CONFIG_PATH='/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH'" >> ~/.bashrc
fi
cd ..

#libsecp256k1
git clone https://github.com/bitcoin-core/secp256k1
cd secp256k1
git checkout ac83be33
./autogen.sh
./configure --enable-module-schnorrsig --enable-experimental
make
make check
sudo  make install
cd ..

#cardano-node and cardano-wallet
mkdir -p "cardano-wallet"
cd cardano-wallet
wget https://github.com/cardano-foundation/cardano-wallet/releases/download/v2023-04-14/cardano-wallet-v2023-04-14-linux64.tar.gz
tar -xvzf cardano-wallet-v2023-04-14-linux64.tar.gz
mv cardano-wallet-v2023-04-14-linux64/cardano-wallet "$HOME/.local/bin/"
mv cardano-wallet-v2023-04-14-linux64/cardano-node "$HOME/.local/bin/"
cd ..

#kupo
mkdir -p "kupo"
cd kupo
wget https://github.com/CardanoSolutions/kupo/releases/download/v2.6/kupo-2.6.1-amd64-Linux.tar.gz
tar -xvzf kupo-2.6.1-amd64-Linux.tar.gz
chmod +x bin/kupo
mv bin/kupo "$HOME/.local/bin/"
cd ..

#encoins-relay
wget https://github.com/encryptedcoins/encoins-relay/releases/download/v1-rc1/encoins-relay-v1-rc1-linux64.tar.gz
tar -xvzf encoins-relay-v1-rc1-linux64.tar.gz
cd encoins-relay-v1-rc1-linux64
mv encoins "$HOME/.local/bin/"
mv encoins-client "$HOME/.local/bin/"
mv encoins-poll "$HOME/.local/bin/"
mv encoins-verifier "$HOME/.local/bin/"
cd ..

#run scripts
cd ..
rm -f -r cardano-src
cd mainnet/scripts
session="encoins-relay-server-setup";
tmux new-session -d -s $session;
window=0;
tmux send-keys -t $session:$window "cd encoins-tools/mainnet/scripts" C-m ENTER;
tmux send-keys -t $session:$window "./kupo.sh" C-m ENTER;
tmux split-window -v;
tmux send-keys -t $session:$window "cd encoins-tools/mainnet/scripts" C-m ENTER;
tmux send-keys -t $session:$window "./wallet.sh" C-m ENTER;
tmux split-window -v;
tmux send-keys -t $session:$window "cd encoins-tools/mainnet/scripts" C-m ENTER;
tmux send-keys -t $session:$window "./node.sh" C-m ENTER;
tmux attach -t $session;