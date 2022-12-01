USE HockeyShop

SELECT * FROM Product_image

SELECT Product_image.Id,Product_image.Url , (Categories.Name + '(' + Manufacturer.Name +')') AS Name
FROM Product_image, Categories, Manufacturer
WHERE Product_image.Product_id = Manufacturer.Id AND Product_image.Product_id = Categories.Id

SELECT * FROM Users

SELECT Name, Email
FROM Users
WHERE EXISTS (SELECT * FROM Orders WHERE Orders.User_id = Users.Id)


INSERT INTO Product_description (Status, Size, Price, Description) VALUES
(
		'Available',
		'Adult',
		 1200,
		'Brand new'
)

DELETE FROM Product_description
WHERE Id IN (SELECT TOP 1 Id FROM Product_description ORDER BY Id DESC)

SELECT * FROM Product_description

INSERT INTO Products (Category_id, Name, Product_description_id, Manufacturer_id, Discount_id) VALUES (1, 'M37', 6, 2, 1)

DELETE FROM Products
WHERE Id IN (SELECT TOP 1 Id FROM Products ORDER BY Id DESC)

SELECT * FROM Products

SELECT Id,
(SELECT Name FROM Categories WHERE Categories.Id = Products.Category_id) AS Category,
Name,
(SELECT Price FROM Product_description WHERE Product_description.Id = Products.Product_description_id) AS Price,
(SELECT Name FROM Manufacturer WHERE Manufacturer.Id = Products.Manufacturer_id) AS Manufacturer,
(SELECT Discount FROM Discount WHERE Discount.Id = Products.Discount_id) AS Discount
FROM Products
WHERE NOT EXISTS (SELECT * FROM Orders_Products WHERE Orders_Products.Product_id = Products.Id)

SELECT * FROM Orders_Products

SELECT Orders.Created_date, Users.Name
FROM Orders
JOIN Users ON Users.Id=Orders.User_id
ORDER BY Created_date

SELECT Products.Name
FROM Orders_Products
JOIN Products ON Products.Id = Orders_Products.Product_id

SELECT (SELECT +'('+(SELECT Name FROM Manufacturer WHERE Manufacturer.Id = Products.Manufacturer_id)+')' + Name FROM Products WHERE Products.Id = Orders_Products.Product_id) AS Name,
(SELECT(SELECT Name FROM Users WHERE Users.Id = Orders.User_id) FROM Orders WHERE Orders.Id = Orders_Products.Order_id) AS UserName
FROM Orders_Products

SELECT *
FROM Products
LEFT JOIN Product_description ON Products.Product_description_id = Product_description.Id
WHERE Product_description.Status = 'Available'
ORDER BY Product_description.Price

SELECT *
FROM Users
CROSS JOIN Roles
WHERE Users.Role_id = Roles.Id

SELECT Name, COUNT(Orders.Id) As NumberOfOrders
FROM Users LEFT JOIN Orders 
ON Orders.User_id = Users.Id
GROUP BY Users.Id, Users.Name
HAVING COUNT(Orders.Id) > 1

SELECT Carts_Products.Added_date, Products.Name, Categories.Name AS Category, Users.Name AS Customer, Manufacturer.Name As Manufacturer
FROM Carts_Products
LEFT JOIN Products ON Carts_Products.Product_id = Products.Id
LEFT JOIN Categories ON Products.Category_id = Categories.Id
LEFT JOIN Users ON (SELECT User_id FROM Carts WHERE Carts_Products.Cart_id = Carts.User_id) = Users.Id
LEFT JOIN Manufacturer ON Manufacturer.Id = Products.Manufacturer_id
	
SELECT User_logs.Message, Users.Name, Roles.Name As Role, Carts_Products.Added_date, Categories.Name + '('+ Manufacturer.Name + Products.Name +')' AS Product,
Product_description.Price, Product_image.Url
FROM User_logs
RIGHT JOIN Users ON User_logs.User_id = Users.Id
RIGHT JOIN Roles ON Users.Role_id = Roles.Id
LEFT JOIN Carts_Products ON (SELECT User_id FROM Carts WHERE Carts_Products.Cart_id = Carts.User_id) = Users.Id
LEFT JOIN Products ON Carts_Products.Product_id = Products.Id
LEFT JOIN Categories ON Products.Category_id = Categories.Id
LEFT JOIN Manufacturer ON Products.Manufacturer_id = Manufacturer.Id
LEFT JOIN Product_description ON Products.Product_description_id = Product_description.Id
LEFT JOIN Product_image ON Product_image.Product_id = Products.Id
WHERE Roles.Name LIKE 'Customer' AND CHARINDEX('cart', Message)>0


SELECT Price,
(SELECT Name FROM Products WHERE Products.Product_description_id = Product_description.Id) As Name,
	IIF(Price>900,'Expensive','Cheap') AS Info
FROM Product_description

SELECT Discount,
	CASE
        WHEN Discount > 40 THEN 'Premium Discount'
        WHEN Discount BETWEEN 20 AND 40 THEN 'Golden Discount'
        WHEN Discount BETWEEN 5 AND 20 THEN 'Silver Discount'
        ELSE 'Without Discount'
    END AS DiscountInfo
FROM Discount
ORDER BY Discount







