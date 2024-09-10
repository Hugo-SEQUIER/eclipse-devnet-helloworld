sudo apt update && sudo apt upgrade -y

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.bashrc
sudo apt update && sudo apt upgrade -y
ECHO '---- Rust installed ----'

# Install Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.bashrc
nvm install 20
node -v
ECHO '---- Nodejs installed ----'

# Install Solana CLI
sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"
export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"
source ~/.bashrc
solana --version
ECHO '---- Solana Installed ----'

# Solana config
solana config set --url https://staging-rpc.dev2.eclipsenetwork.xyz
solana-keygen new -o /root/.config/solana/id.json
pip install json base58
python convert_array_to_private_key.py
solana airdrop 10
ECHO '---- Solana Configured ----'

# Config HelloWorld
sudo apt install build-essential
npm install
npm run build:program-rust
solana program deploy dist/program/solana_bpf_helloworld.so
npm run start
ECHO '---- Contract Deployed ----'