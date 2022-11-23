USE HockeyShop

INSERT INTO Roles (Name) VALUES ('Admin')
INSERT INTO Roles (Name) VALUES ('Customer')
INSERT INTO Roles (Name) VALUES ('Moderator')

INSERT INTO Users (Name, Email, Password, Role_id) VALUES('Dima D', 'aboba@mail.ru', 'adcbfg1', 1)/*admin*/
INSERT INTO Users (Name, Email, Password, Role_id) VALUES('Ovi', 'nhl2022@khl.com', '123456789@', 3)
INSERT INTO Users (Name, Email, Password, Role_id) VALUES('Pasha Dol', 'hocky@gmail.com', 'fhafaf', 2)
INSERT INTO Users (Name, Email, Password, Role_id) VALUES('Gleb Zik', 'gleb2277@gmail.com', 'xrpabc', 2)
INSERT INTO Users (Name, Email, Password, Role_id) VALUES('Koliasik', 'nikolay1337@mail.ru', 'lolkek', 2)

INSERT INTO User_logs (User_id, Message) VALUES (1, 'Admin added product')
INSERT INTO User_logs (User_id, Message) VALUES (2, 'Moderator changed discount')
INSERT INTO User_logs (User_id, Message) VALUES (3, 'User added product to the cart')
INSERT INTO User_logs (User_id, Message) VALUES (4, 'User made order')

INSERT INTO Manufacturer(Name) VALUES ('Bauer')
INSERT INTO Manufacturer(Name) VALUES ('Ccm')
INSERT INTO Manufacturer(Name) VALUES ('Reebok')
INSERT INTO Manufacturer(Name) VALUES ('Easton')
INSERT INTO Manufacturer(Name) VALUES ('Sher-Wood')
INSERT INTO Manufacturer(Name) VALUES ('Warrior')
INSERT INTO Manufacturer(Name) VALUES ('TPS')

INSERT INTO Product_description (Status, Size, Price, Description) VALUES
(
		'Available',
		'Junior',
		 1000,
		'Brand new'
)

INSERT INTO Product_description (Status, Size, Price, Description) VALUES
(
		'Unavailable',
		'Adult',
		 1270,
		'well-worn'
)

INSERT INTO Product_description (Status, Size, Price, Description) VALUES
(
		'Available',
		'Children',
		850,
		'Minimal wear'
)

INSERT INTO Product_description (Status, Size, Price, Description) VALUES
(
		'Available',
		'Children',
		770,
		'Minimal wear'
)

INSERT INTO Product_description (Status, Size, Price, Description) VALUES
(
		'Available',
		'Adult',
		2950,
		'Minimal wear'
)

INSERT INTO Discount (Discount) VALUES (DEFAULT)
INSERT INTO Discount (Discount) VALUES (10)
INSERT INTO Discount (Discount) VALUES (20)
INSERT INTO Discount (Discount) VALUES (30)
INSERT INTO Discount (Discount) VALUES (5)

INSERT INTO Categories (Name) VALUES ('Hockey skates')
INSERT INTO Categories (Name) VALUES ('Hockey sticks')
INSERT INTO Categories (Name) VALUES ('Goaltender equipment')
INSERT INTO Categories (Name) VALUES ('Helmet and Visor')
INSERT INTO Categories (Name) VALUES ('Gloves')
INSERT INTO Categories (Name) VALUES ('Elbow pad')
INSERT INTO Categories (Name) VALUES ('Knee pad')

INSERT INTO Products (Category_id, Name, Product_description_id, Manufacturer_id, Discount_id) VALUES (1, 'X1', 1, 1, 5)
INSERT INTO Products (Category_id, Name, Product_description_id, Manufacturer_id, Discount_id) VALUES (2, 'VAPOR XS', 3, 1, 1)
INSERT INTO Products (Category_id, Name, Product_description_id, Manufacturer_id, Discount_id) VALUES (4, 'S1', 2, 4, 2)
INSERT INTO Products (Category_id, Name, Product_description_id, Manufacturer_id, Discount_id) VALUES (5, 'Pandora Box', 4, 5, 4)
INSERT INTO Products (Category_id, Name, Product_description_id, Manufacturer_id, Discount_id) VALUES (6, 'ultra protect', 5, 6, 3)

INSERT INTO Product_image (Product_id, Url) VALUES (1, 'https:///img/galleries/7257/682/preview_b/xlss211058933_bauer_622c661fe603c.jpeg')
INSERT INTO Product_image (Product_id, Url) VALUES (2, 'https:///img/galleries/7222/733/preview_b/vaporx9240r1057026_bauer_63396ae4.jpeg')
INSERT INTO Product_image (Product_id, Url) VALUES (3, 'https:///files/catalog/dp0003860b.jpeg')
INSERT INTO Product_image (Product_id, Url) VALUES (4, 'https:///files/catalog/128884.jpg')
INSERT INTO Product_image (Product_id, Url) VALUES (5, 'https:///files/catalog/dp7006972b.jpeg')

INSERT INTO Carts (User_id) VALUES (1)
INSERT INTO Carts (User_id) VALUES (2)
INSERT INTO Carts (User_id) VALUES (3)
INSERT INTO Carts (User_id) VALUES (4)
INSERT INTO Carts (User_id) VALUES (5)

INSERT INTO Orders(User_id, Created_date, Sum) VALUES (1, '2022-11-22', 777)
INSERT INTO Orders(User_id, Created_date, Sum) VALUES (1, '2022-10-23', 547)
INSERT INTO Orders(User_id, Created_date, Sum) VALUES (2, '2021-1-7', 1234)
INSERT INTO Orders(User_id, Created_date, Sum) VALUES (3, '2020-12-29', 709)
INSERT INTO Orders(User_id, Created_date, Sum) VALUES (4, '2019-9-12', 456)
INSERT INTO Orders(User_id, Created_date, Sum) VALUES (5, '2022-8-6', 1000)

INSERT INTO Orders_Products (Order_id, Product_id) VALUES (6,3)
INSERT INTO Orders_Products (Order_id, Product_id) VALUES (6,1)
INSERT INTO Orders_Products (Order_id, Product_id) VALUES (5,1)
INSERT INTO Orders_Products (Order_id, Product_id) VALUES (4,2)
INSERT INTO Orders_Products (Order_id, Product_id) VALUES (3,4)
INSERT INTO Orders_Products (Order_id, Product_id) VALUES (2,5)

INSERT INTO Carts_Products(Cart_id, Product_id, Added_date) VALUES (1, 1, '2022-11-22')
INSERT INTO Carts_Products(Cart_id, Product_id, Added_date) VALUES (1, 2, '2022-11-22')
INSERT INTO Carts_Products(Cart_id, Product_id, Added_date) VALUES (1, 3, '2022-11-22')
INSERT INTO Carts_Products(Cart_id, Product_id, Added_date) VALUES (1, 4, '2022-11-22')
INSERT INTO Carts_Products(Cart_id, Product_id, Added_date) VALUES (1, 5, '2022-11-22')
INSERT INTO Carts_Products(Cart_id, Product_id, Added_date) VALUES (3, 1, '2022-10-17')
INSERT INTO Carts_Products(Cart_id, Product_id, Added_date) VALUES (5, 1, '2022-8-6')
INSERT INTO Carts_Products(Cart_id, Product_id, Added_date) VALUES (5, 3, '2022-8-6')