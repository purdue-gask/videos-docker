# A non-default bridge network enables convenient name-to-hostname discovery

docker network create kafka-net



docker run -d --rm --name zookeeper --network kafka-net zookeeper:3.4

docker run -d --rm --name kafka --network kafka-net --env ZOOKEEPER_IP=zookeeper ches/kafka



docker run --rm --network kafka-net ches/kafka kafka-topics.sh --create --topic video --partitions 1 --zookeeper zookeeper:2181
docker run --rm --network kafka-net ches/kafka kafka-topics.sh --create --topic metadata --partitions 1 --zookeeper zookeeper:2181



