#!/bin/bash

# Simple Interest Calculation Script

# Function to calculate simple interest
calculate_simple_interest() {
    principal=$1
    rate=$2
    time=$3

    # Simple Interest formula: SI = (P * R * T) / 100
    interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
    echo "Simple Interest: $interest"
}

# Input values
echo "Enter the Principal amount:"
read principal
echo "Enter the Rate of interest:"
read rate
echo "Enter the Time period (in years):"
read time

# Validate inputs
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
    echo "Error: All inputs (Principal, Rate, and Time) are required."
    exit 1
fi

if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Please enter valid numeric values for Principal, Rate, and Time."
    exit 1
fi

# Call the function with inputs
calculate_simple_interest $principal $rate $time
