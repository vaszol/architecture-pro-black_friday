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

Для проверки вручную 1 шарда:
```
 docker exec -it shard1 mongosh --port 27018
 > use somedb;
 > db.helloDoc.countDocuments();
 > exit();
```
Для проверки вручную 2 шарда:
```
 docker exec -it shard1 mongosh --port 27019
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




