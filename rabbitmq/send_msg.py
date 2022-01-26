import pika

credentials = pika.PlainCredentials('serverworld', 'strongpassword')
connection = pika.BlockingConnection(pika.ConnectionParameters(
                                     'localhost',
                                     5672,
                                     '/my_vhost',
                                     credentials))

channel = connection.channel()
channel.queue_declare(queue='Hello_World')

channel.basic_publish(exchange='',
                      routing_key='Hello_World',
                      body='Hello RabbitMQ World!')

print(" [x] Sent 'Hello_World'")

connection.close()
