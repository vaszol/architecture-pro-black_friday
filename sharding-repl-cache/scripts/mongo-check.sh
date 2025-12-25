#!/bin/bash

###
# Проверяем бд
###

docker compose exec -T mongos_router mongosh --port 27020 --quiet <<EOF
use somedb;
print("Всего документов: " + db.helloDoc.countDocuments());
EOF

docker compose exec -it shard1 mongosh --port 27022 --quiet <<EOF
use somedb;
print("shard1 документов: " + db.helloDoc.countDocuments());
EOF

docker compose exec -it shard1b mongosh --port 27023 --quiet <<EOF
use somedb;
print("shard1b документов: " + db.helloDoc.countDocuments());
EOF

docker compose exec -it shard1c mongosh --port 27024 --quiet <<EOF
use somedb;
print("shard1c документов: " + db.helloDoc.countDocuments());
EOF

docker compose exec -it shard2 mongosh --port 27025 --quiet <<EOF
use somedb;
print("shard2 документов: " + db.helloDoc.countDocuments());
EOF

docker compose exec -it shard2b mongosh --port 27026 --quiet <<EOF
use somedb;
print("shard2b документов: " + db.helloDoc.countDocuments());
EOF

docker compose exec -it shard2c mongosh --port 27027 --quiet <<EOF
use somedb;
print("shard2c документов: " + db.helloDoc.countDocuments());
EOF


# Не закрывать терминал сразу
read -p "Нажмите Enter для выхода..."