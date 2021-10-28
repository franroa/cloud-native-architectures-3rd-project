kubectl port-forward svc/kafka 9092 &

export KAFKA_URL=localhost:9092
export KAFKA_TOPIC=test

python3 server.py

python3 writer.py
