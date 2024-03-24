#!/bin/bash

# Loop from 1 to 99
for ((i = 1; i <= 99; i++)); do
    # Print the number with leading zero if less than 10
    printf "%02d\n" $i
    # Pause for 1 second
    #sleep 1
done | /usr/local/kafka/bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092

