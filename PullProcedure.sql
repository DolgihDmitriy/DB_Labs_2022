USE HockeyShop
GO 

GO
CREATE PROCEDURE ProductSummary AS
BEGIN 
	SELECT Name,
	(SELECT Name FROM Categories WHERE Products.Category_id = Categories.Id) AS Category,
	(SELECT Name FROM Manufacturer WHERE Products.Manufacturer_id = Manufacturer.Id) AS Manufacturer,
	(SELECT Discount FROM Discount WHERE Products.Discount_id = Discount.Id) AS Discount,
	(SELECT Price FROM Product_description WHERE Products.Product_description_id = Product_description.Id) AS Price
	FROM Products
END;

/*EXEC ProductSummary*/

GO
CREATE PROCEDURE UserInfo AS
BEGIN 
	SELECT Name,Email,Password,
	(SELECT name FROM Roles WHERE Users.Role_id = Roles.Id) AS Roles
	FROM Users
END;

GO 
CREATE PROCEDURE AddDescription
	@status VARCHAR(120),
	@size VARCHAR(100),
	@price INT,
	@description VARCHAR(100)
AS
INSERT INTO Product_description(Status, Size, Price, Description)
VALUES(@status, @size, @price, @description)

EXEC AddDescription 'available', 'adult', 777, 'cool'

SELECT * FROM Product_description

GO
CREATE PROCEDURE AddProduct
	@category INT,
	@name VARCHAR(30),
	@manufacturer INT,
	@discount INT,


	@status VARCHAR(120),
	@size VARCHAR(100),
	@price INT,
	@description VARCHAR(100)
AS 

	EXEC AddDescription @status, @size, @price, @description

	INSERT INTO Products(Category_id, Name, Manufacturer_id, Discount_id,Product_description_id)
	VALUES(
		@category,
		@name, 
		@manufacturer,
		@discount,
		(SELECT Id FROM Product_description WHERE Id = (SELECT MAX(Id) FROM Product_description))
		)

EXEC AddProduct 2, 'lol', 4, 3, 'unavailable', 'children', 1700, 'amazing'

DROP PROCEDURE AddProduct

GO 
CREATE PROC AddUser
	@name VARCHAR(50),
	@email VARCHAR(60),
	@password VARCHAR(100),
	@role INT
AS 
	INSERT INTO Users(Name,Email, Password,Role_id)
	VALUES(@name, @email, @password, @role)

EXEC AddUser 'Alex', 'gleb2277@gmail.com', 'xrpabc', 2

GO 
CREATE PROC AddCart
AS
	INSERT INTO Carts(User_id)
	VALUES((SELECT Id FROM Users WHERE Id = (SELECT TOP 1 Id FROM Users ORDER BY Id DESC)))

EXEC AddCart

GO 
CREATE PROC RemoveProduct
	@name VARCHAR(100)
AS
	DELETE Products
	WHERE Name = @name

EXEC RemoveProduct 'dfhdb'

GO
CREATE PROC RemoveProductDesc
	@description VARCHAR(100),
	@price INT
AS 
	DELETE Product_description
	WHERE Description = @description OR Price = @price

EXEC RemoveProductDesc 'bad', 777

GO
CREATE PROC RemoveCart
	@user INT
AS 
	DELETE Carts
	WHERE User_id = @user

EXEC RemoveCart 6

GO
CREATE PROC RemoveUser
	@name VARCHAR(100)
AS 
	/*DELETE Carts WHERE Carts.User_id = (SELECT Id FROM Users WHERE Name = @name)*/
	DELETE Users WHERE Name = @name

EXEC RemoveUser 'Ovi'
