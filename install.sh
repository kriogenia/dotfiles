#!/usr/bin/bash

set -euo pipefail

echo "Checking all required packages are installed"
while read -r pkg; do
  which "$pkg"
done <"./requirements.txt"
