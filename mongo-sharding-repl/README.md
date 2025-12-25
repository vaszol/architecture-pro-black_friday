# pymongo-api

## Как запустить

Запускаем mongodb и приложение:

```shell
docker compose up -d
```

Заполняем mongodb данными:

```shell
./scripts/mongo-init.sh
```

Проверка одной командой:

```shell
./scripts/mongo-check.sh
```

Для проверки вручную 1 шарда shard1:
```
 docker exec -it shard1 mongosh --port 27022
 > use somedb;
 > db.helloDoc.countDocuments();
 > exit();
```
Для проверки вручную 1 шарда shard1b:
```
 docker exec -it shard1b mongosh --port 27023
 > use somedb;
 > db.helloDoc.countDocuments();
 > exit();
```
Для проверки вручную 1 шарда shard1c:
```
 docker exec -it shard1c mongosh --port 27024
 > use somedb;
 > db.helloDoc.countDocuments();
 > exit();
```
Для проверки вручную 2 шарда shard2:
```
 docker exec -it shard2 mongosh --port 27025
 > use somedb;
 > db.helloDoc.countDocuments();
 > exit();
```
Для проверки вручную 2 шарда shard2b:
```
 docker exec -it shard2b mongosh --port 27026
 > use somedb;
 > db.helloDoc.countDocuments();
 > exit();
```
Для проверки вручную 2 шарда shard2c:
```
 docker exec -it shard2c mongosh --port 27027
 > use somedb;
 > db.helloDoc.countDocuments();
 > exit();
```

Проверка запуска на локальной машине: http://localhost:8080/

Список доступных эндпоинтов, swagger: http://localhost:8080/docs

Остановить и очистить docker:

```shell
docker compose down --rmi all -v
```




