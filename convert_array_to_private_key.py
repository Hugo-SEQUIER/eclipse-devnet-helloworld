import json
import base58

with open('/root/.config/solana/id.json', 'r') as f:
    keypair = json.load(f)

private_key = base58.b58encode(bytes(keypair)).decode()
print(f"Private key (base58): {private_key}")