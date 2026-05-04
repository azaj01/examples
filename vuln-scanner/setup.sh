#!/usr/bin/env bash
# One-time setup. Re-running is safe.
set -e

python -m pip install -q anthropic pydantic python-dotenv tensorlake

tl login
tl init

[ -f .env ] || echo "ANTHROPIC_API_KEY=" > .env

python vuln_scanner.py --build-image

echo "Done. Add your ANTHROPIC_API_KEY to .env, then: python vuln_scanner.py"
