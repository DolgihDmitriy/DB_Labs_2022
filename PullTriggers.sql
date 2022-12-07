USE HockeyShop 
GO

CREATE TRIGGER Products_INSERT
ON Products
AFTER INSERT 
AS
		INSERT INTO User_logs(User_id, Message)
		SELECT (SELECT Id FROM Users WHERE Users.Role_id = 1), 'Добавлен товар' + Name + ' фирма' + (SELECT Name FROM Manufacturer WHERE inserted.Manufacturer_id = Manufacturer.Id)
		FROM inserted

DROP TRIGGER Products_INSERT

INSERT INTO Products(Category_id,Name, Product_description_id,Manufacturer_id,Discount_id) VALUES(1,'WWW', 7, 1, 1)

SELECT * FROM User_logs

GO
CREATE TRIGGER Products_DELETE
ON Products
AFTER DELETE 
AS
		INSERT INTO User_logs(User_id, Message)
		SELECT (SELECT Id FROM Users WHERE Users.Role_id = 1), 'Удален товар' + Name + ' фирма' + (SELECT Name FROM Manufacturer WHERE deleted.Manufacturer_id = Manufacturer.Id)
		FROM deleted

GO
CREATE TRIGGER User_INSERT
ON Users
AFTER INSERT 
AS
		INSERT INTO User_logs(User_id, Message)
		SELECT inserted.Id, 'Добавлен пользователь ' + inserted.Name + ' роли ' + (SELECT Name From Roles WHERE inserted.Role_id = Roles.Id)
		FROM inserted

DROP TRIGGER User_INSERT

GO 
CREATE TRIGGER User_DELETE
ON Users
AFTER DELETE
AS
		INSERT INTO User_logs(User_id, Message)
		SELECT deleted.Id, 'Удален пользователь ' + deleted.Name + ' роли ' + (SELECT Name From Roles WHERE deleted.Role_id = Roles.Id)
		FROM deleted

DROP TRIGGER User_DELETE