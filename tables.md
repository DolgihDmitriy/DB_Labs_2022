# Описание сущностей (таблиц)
## users (Пользователи)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| cart_id | fk(INT) | not null | корзина пользователя |
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
| category_id | fk(INT) | not null | категория |
| name | VARCHAR(150) | not null | название товара |
| product_description_id | fk(INT) | not null | внешний ключ на описание товара |
| manufacturer_id | fk(INT) | not null | производитель |
| discount_id | fk(INT) | not null | скидка |


## categories (Категории товаров)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| name | VARCHAR(100) | not null | Название категории |


## manufacturer (Производитель)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| name | VARCHAR(100) | not null | Производитель|


## orders (Заказы)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| user_id | fk(INT) | not null; unique | пользователь |
| created_date | date | not null | время заказа |
| sum | INT | not null | общая сумма заказа |


## product_image (Фото товара)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| product_id | fk(INT) | not null | товар |
| url | VARCHAR(300) | not null | путь к фото |


## discount (Скидка)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT)) | auto increment; not null; unique | первичный ключ |
| discount | INT | not null | скидка |


## orders&products (Заказы и продукты)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| order_id | fk(INT) | not null | номер заказа |
| product_id | fk(INT) | not null | товар |


## product_description (Описание товаров)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| price | INT | not null | цена товара |
| description | VARCHAR(1000) | not null | описание товара |
| status | VARCHAR(120) | not null; default(moderation) | статус товара |
| size| VARCHAR(100) | not null | размер |


## сarts(Корзина)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| user_id | fk(INT) | not null | пользователь |


## carts&products (Корзина и продукты)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| cart_id | fk(INT) | not null | корзина пользователя |
| product_id | fk(INT) | not null | товар |
| added_date | date | not null | время добавления товара в корзину |


Связи многие ко многим для которых были созданы промежуточные таблицы:

1.В заказе может быть несколько товаров, товары могут содержаться в разных заказах
2.В корзине может быть несколько товаров, товары могут принадлежать разным корзинам