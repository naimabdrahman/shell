## Install kafka service

- install kafka tarball
```
./install-kafka.sh
```

- once all services are up, to create topics 
```
./kafka-topics-create.sh
```
- or, optionally to create topics with multiple partitions
```
./kafka-topics-create-multi-partition.sh
```

- to check/describe topics (this is for topics validation)
```
./kafka-topics-describe.sh
```

- script below is to produce message (num sequence from 00-99 with 1 sec sleep between each num)
```
./kafka-console-producer.sh
```
- or, optionally to produce message (num sequence from 00-99 without 1 sec sleep) 
```
./kafka-console-producer-nosleep.sh
```

- script below is to consume message
```
./kafka-console-consumer.sh
```

- once test completed, script below is to delete topics
```
./kafka-topics-delete.sh
```


## List of Shell scripts
```
install-kafka.sh
kafka-console-consumer.sh
kafka-console-producer-nosleep.sh
kafka-console-producer.sh
kafka-topics-create-multi-partition.sh
kafka-topics-create.sh
kafka-topics-delete.sh
kafka-topics-describe.sh
```
