USE HockeyShop

SELECT * FROM Products

SELECT '(' + (SELECT Name FROM Manufacturer WHERE Manufacturer.Id = Products.Manufacturer_id) + ')' + Name AS ModelName,
(SELECT Name FROM Categories WHERE Categories.Id = Products.Category_id) AS Category,
(SELECT Price FROM Product_description WHERE Product_description.Id = Products.Product_description_id) AS Price
FROM Products
WHERE Products.Manufacturer_id = 1
ORDER BY Price

SELECT * FROM Users

SELECT Id,
(SELECT Name FROM Roles WHERE Roles.Id = Users.Role_id) AS Roles,
Name,
Email,
Password
FROM Users
WHERE CHARINDEX('@gmail.com', email) > 0

UPDATE Users
SET Password = '1234567'
WHERE Id = 3
UPDATE Users
SET Password = '7654321'
WHERE Name LIKE 'Gleb%'

SELECT * FROM Carts

SELECT Id,
(SELECT Name FROM Users WHERE Users.Id = Carts.User_id) AS UserName
FROM Carts
ORDER BY UserName

SELECT * FROM Product_image

UPDATE Product_image
SET Url = '///img/gelleries/7257'
WHERE Product_id = 1

SELECT * FROM Product_image
WHERE Url NOT LIKE 'https:%'

SELECT Name, Discount_Id
FROM Products

SELECT Name,
(SELECT Discount FROM Discount WHERE Discount.Id = Products.Discount_id) AS Discount
FROM Products
ORDER BY Discount DESC

SELECT * FROM Discount
WHERE Discount > 5