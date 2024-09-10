sudo apt update && sudo apt upgrade -y

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.bashrc
sudo apt update && sudo apt upgrade -y
echo '---- Rust installed ----'

# Install Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.bashrc
nvm install 20
node -v

echo
echo '---- Nodejs installed ----'
echo

# Install Solana CLI
sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"
export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"
source ~/.bashrc
solana --version

echo
echo '---- Solana Installed ----'
echo

# Solana config
solana config set --url https://staging-rpc.dev2.eclipsenetwork.xyz
solana-keygen new -o /root/.config/solana/id.json
solana airdrop 10

npm install bs58 @solana/web3.js fs
echo
echo '---- Your Private Key (to export on a Wallet Manager) ----'
node convert_array_to_key.mjs
echo '---- Your Private Key (to export on a Wallet Manager) ----'
echo
echo '---- Solana Configured ----'
echo

# Config HelloWorld
sudo apt install build-essential
npm install
npm run build:program-rust
solana program deploy dist/program/solana_hugo_helloworld.so
npm run start

echo
echo '---- Contract Deployed ----'
echo