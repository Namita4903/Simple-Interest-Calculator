
#!/usr/bin/env bash
# simple-interest.sh - Compute simple interest from user input.
# Formula: SI = (Principal * Rate * Time) / 100

set -euo pipefail

read -rp "Enter principal amount: " PRINCIPAL
read -rp "Enter annual rate of interest (%): " RATE
read -rp "Enter time period (in years): " TIME

# Validate numeric input
is_number() {
  [[ "$1" =~ ^([0-9]+([.][0-9]+)?)$ ]]
}

if ! is_number "$PRINCIPAL" || ! is_number "$RATE" || ! is_number "$TIME"; then
  echo "Error: Please enter valid numeric values." >&2
  exit 1
fi

# Calculate Simple Interest
SI=$(awk -v p="$PRINCIPAL" -v r="$RATE" -v t="$TIME" 'BEGIN { printf "%.2f", (p*r*t)/100 }')
echo "Simple Interest: ₹$SI"
