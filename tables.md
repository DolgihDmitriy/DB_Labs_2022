# Описание сущностей (таблиц)
## users (Пользователи)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| cart_id | fk(INT) | auto increment; not null; unique | корзина пользователя |
| name | VARCHAR(100) | not null | ФИО пользователя |
| email | VARCHAR(70) | not null | почта пользователя |
| password | VARCHAR(270) | not null | пароль пользователя |
| role_id | fk(INT) | not null | статус пользователя |


## roles (Роли Пользователей)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| name | VARCHAR(100) | not null | название роли |


## users_logs (Логи Пользователей)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| user_id | fk(INT) | not null | пользователь |
| message | VARCHAR(400) | not tull | сообщение |


## products (Товары)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| products_descs_id | fk(INT) | not null | описание товара |
| category_id | fk(INT) | not null | категория |


## products_description (Описания товаров)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| name | VARCHAR(150) | not null | название товара |
| price | INT | not null | цена товара |
| description | VARCHAR(1000) | not null | описание товара |
| status | VARCHAR(120) | not null; default(moderation) | статус товара|
| size_id | fk(INT) | not null | размер |
| manufacturer_id | fk(INT) | not null | производитель |
| discount_id | fk(INT) | not null | скидка |


## categories (Категории товаров)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| name | VARCHAR(100) | not null | Название категории |


## size (Размер)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| name | VARCHAR(100) | not null | Размер|


## manufacturer (Производитель)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| name | VARCHAR(100) | not null | Производитель|


## carts (корзина)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| user_id | fk(INT) | not null; unique | пользователь |


## product_image (Фото товара)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| product_id | fk(INT) | not null | товар |
| url | VARCHAR(300) | not null | путь к фото |


## Скидка (discount)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT)) | auto increment; not null; unique | первичный ключ |
| discount | INT | not null | скидка |


## Корзина и товар (carts&products)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| cart_id | fk(INT) | not null | корзина пользователя |
| product_id | fk(INT) | not null | товар |


Связи многие ко многим для которых были созданы промежуточные таблицы:

1.В корзине может быть несколько товаров, товары могут лежать в разных корзинах