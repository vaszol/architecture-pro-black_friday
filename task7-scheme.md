# Проектирование схем коллекций для шардирования данных

## 1. Коллекция orders

схема - [orders.plantuml](orders.plantuml)

### Потенциальные кандидаты для шард-ключей
- user_id
- date
- geo_zone
### Cтратегия шардирования
Горизонтальное партиционирование, шардирование, или сегментирование по user_id, для операций "Поиск истории заказов конкретного пользователя."

Пример команд MongoDB
```
sh.enableSharding('somedb');
sh.shardCollection('somedb.order', { 'user_id': 'hashed' });
```

## 2. Коллекция products

схема - [products.plantuml](products.plantuml)

### Потенциальные кандидаты для шард-ключей
- category
- price
- geo_zone
### Cтратегия шардирования
Горизонтальное партиционирование, шардирование, или сегментирование по category и price, для операций "Поиск товаров по категориям и фильтрация по диапазону цен."

Пример команд MongoDB
```
sh.enableSharding('somedb');
sh.shardCollection('somedb.product',  { category: 'hashed', price: 'hashed' });
```

## 3. Коллекция carts

схема - [carts.plantuml](carts.plantuml)

### Потенциальные кандидаты для шард-ключей
- user_id
- session_id
### Cтратегия шардирования
Горизонтальное партиционирование, шардирование, или сегментирование по user_id, для операций "Слияние гостевой корзины в пользовательскую"

Пример команд MongoDB
```
sh.enableSharding('somedb');
sh.shardCollection('somedb.cart', { 'user_id': 'hashed' });
```
