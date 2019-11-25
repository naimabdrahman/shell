## run redis exporter from docker image
## reference : https://hub.docker.com/r/oliver006/redis_exporter/
## reference : https://github.com/oliver006/redis_exporter
## check port 9121 for monitoring

docker run -dit --name redis_exporter --rm --net=host -e redis.addr=localhost:6379 oliver006/redis_exporter
