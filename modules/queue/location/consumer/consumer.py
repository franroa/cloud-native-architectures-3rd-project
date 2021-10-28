import json
import logging
import os

from kafka import KafkaConsumer
from sqlalchemy import create_engine

kafka_url = os.environ["KAFKA_URL"]
kafka_topic = os.environ["KAFKA_TOPIC"]
DB_USERNAME = os.environ["DB_USERNAME"]
DB_PASSWORD = os.environ["DB_PASSWORD"]
DB_HOST = os.environ["DB_HOST"]
DB_PORT = os.environ["DB_PORT"]
DB_NAME = os.environ["DB_NAME"]

logging.info('connecting to kafka ', kafka_url)
logging.info('connecting to kafka topic ', kafka_topic)
consumer = KafkaConsumer(kafka_topic, bootstrap_servers=[kafka_url])


def write_to_db(location):
    conn = create_engine(f"postgresql://{DB_USERNAME}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}", echo=True)

    user_id = int(location["userId"])
    latitude, longitude = int(location["latitude"]), int(location["longitude"])

    print(latitude)
    table_insert = "INSERT INTO location (person_id, coordinate) VALUES ({}, ST_Point({}, {}))" \
        .format(user_id, latitude, longitude)

    print(table_insert)

    with conn.connect() as connection:
        connection.execute(table_insert)


while True:
    msg_pack = consumer.poll(timeout_ms=500)
    messages = msg_pack.items()
    for tp, messages in msg_pack.items():
        for message in messages:
            write_to_db(json.loads(message.value.decode()))
