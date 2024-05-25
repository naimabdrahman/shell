#!/bin/bash

# Function to measure latency
measure_latency() {
    url=$1

    # Check if URL is provided
    if [ -z "$url" ]; then
        echo "Usage: $0 <url>"
        exit 1
    fi

    # Measure latency using curl and extract the total time
    latency=$(curl -o /dev/null -s -w "%{time_total}\n" "$url")

    # Print the latency
    echo "HTTP request latency for $url: $latency seconds"
}

# Main script
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <url1> <url2> ... <urlN>"
    exit 1
fi

for url in "$@"; do
    measure_latency "$url"
done

