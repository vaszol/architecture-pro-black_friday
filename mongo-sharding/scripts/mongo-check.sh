#!/bin/bash

###
# Проверяем бд
###

docker compose exec -T mongos_router mongosh --port 27020 --quiet <<EOF
use somedb;
print("Всего документов: " + db.helloDoc.countDocuments());
EOF

docker compose exec -it shard1 mongosh --port 27018 --quiet <<EOF
use somedb;
print("shard1 документов: " + db.helloDoc.countDocuments());
EOF
docker compose exec -it shard2 mongosh --port 27019 --quiet <<EOF
use somedb;
print("shard2 документов: " + db.helloDoc.countDocuments());
EOF


# Не закрывать терминал сразу
read -p "Нажмите Enter для выхода..."