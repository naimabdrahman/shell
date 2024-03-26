#!/bin/bash

tail -f /var/log/messages | /usr/local/kafka/bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092


