#!/bin/bash

###
# Инициализируем бд
###

docker compose exec -T configSrv mongosh --port 27021 --quiet <<EOF
rs.initiate(
  {
    _id: "config_server",
    configsvr: true,
    members: [
      { _id: 0, host: "configSrv:27021" }
    ]
  }
)
EOF

docker compose exec -T shard1 mongosh --port 27022 --quiet <<EOF
rs.initiate(
  {
    _id: "shard1",
    members: [
      { _id: 0, host: "shard1:27022" },
      { _id: 1, host: "shard1b:27023" },
      { _id: 2, host: "shard1c:27024" }
    ]
  }
)
EOF

docker compose exec -T shard2 mongosh --port 27025 --quiet <<EOF
rs.initiate(
  {
    _id: "shard2",
    members: [
      { _id: 0, host: "shard2:27025" },
      { _id: 1, host: "shard2b:27026" },
      { _id: 2, host: "shard2c:27027" }
    ]
  }
)
EOF

docker compose exec -T mongos_router mongosh --port 27020 --quiet <<EOF
sh.addShard("shard1/shard1:27022,shard1b:27023,shard1c:27024");
sh.addShard("shard2/shard2:27025,shard2b:27026,shard2c:27027");
sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", {name:"hashed"} );
use somedb;
for (let i=0;i<1000;i++) db.helloDoc.insertOne({ age:i, name:"user"+i });
db.helloDoc.countDocuments();
db.helloDoc.getShardDistribution();
EOF


# Не закрывать терминал сразу
read -p "Нажмите Enter для выхода..."