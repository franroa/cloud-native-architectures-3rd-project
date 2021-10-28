##Creating gRPC objects
pip install grpcio-tools
python3 -m grpc_tools.protoc -I./ --python_out=./ --grpc_python_out=./ location_event.proto

##Testing gRPC calls
python3 writer.py



k run --image=docker.io/confluentinc/cp-server-operator:5.3.0.0  tmp2 --restart Never --rm -ti -- bash
kafka-topics -bootstrap-server kafka:9071 --list
kafka-console-consumer --bootstrap-server kafka:9071 --topic test --from-beginning

enter the producer and consumer and execute the files



kubectl run pgsql-postgresql-client3 --rm --tty -i --restart='Never' --namespace default --image docker.io/bitnami/postgresql:11.7.0-debian-10-r9 --env="PGPASSWORD=$POSTGRES_PASSWORD" --command -- psql postgres --host 10.43.150.135 -U ct_admin -d postgres -p 5432
wowimsosecure