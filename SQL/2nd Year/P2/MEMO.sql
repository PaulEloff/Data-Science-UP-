--------------------------------------------------
--QUESTION 1
--------------------------------------------------
DROP Database EliteShop
Go

CREATE DATABASE EliteShop
GO

USE EliteShop
GO
--------------------------------------------------
--QUESTION 2
--------------------------------------------------

-- there is no need to create schemas because this is a small db
-- they are nonetheless important in other larger dbs
-- the following creates the tables

use EliteShop
go

CREATE TABLE Device_Type
(Device_TypeID             INT             IDENTITY(1,1),
Device_Type_Name           VARCHAR(50)     NULL,
CONSTRAINT pk_devicetype PRIMARY KEY (Device_TypeID))
GO

USE EliteShop
GO

CREATE TABLE Manufacturer
(Manufacturer_Code         VARCHAR(10) NOT NULL,
Manufacturer_Description   VARCHAR(100)    NULL,
CONSTRAINT pk_manufacturer PRIMARY KEY (Manufacturer_Code))
GO


USE EliteShop
GO

CREATE TABLE [Platform]
(PlatformID           INT             IDENTITY(1,1),
Platform_Description  varchar(100)    NULL,
CONSTRAINT pk_rating PRIMARY KEY (PlatformID))
GO


USE EliteShop
GO

CREATE TABLE Device
(DeviceID           INT     IDENTITY(1,1),
Device_TypeID       INT NOT NULL,
PlatformID          INT NOT NULL,
Manufacturer_Code   VARCHAR(10) NOT NULL,
Model               VARCHAR(50) NOT NULL,
InternalMemory      VARCHAR(10) NOT NULL,
Price               MONEY NOT NULL,
CONSTRAINT pk_device PRIMARY KEY (DeviceID),
CONSTRAINT fk_devicetodevicetype FOREIGN KEY (Device_TypeID) REFERENCES Device_Type(Device_TypeID),
CONSTRAINT fk_devicetomanufacturer FOREIGN KEY (Manufacturer_Code) REFERENCES Manufacturer(Manufacturer_Code),
CONSTRAINT fk_videotoplatform FOREIGN KEY (PlatformID) REFERENCES [Platform](PlatformID))
GO



--------------------------------------------------
--QUESTION 3
--------------------------------------------------


--QUESTION 3.1 (INSERT_Device_Type.sql)
--------------------------------------------------

INSERT INTO Device_Type
(Device_Type_Name)
VALUES('Cellphone'), ('Tablet')
GO


--QUESTION 3.2 (INSERT_ Manufacturer.sql)
--------------------------------------------------

INSERT INTO Manufacturer
(Manufacturer_Code, Manufacturer_Description)
VALUES ('a', 'Samsung'), ('b', 'Nokia'), ('c', 'Blackberry'),('d', 'Apple'),('e', 'Sony')
GO


--QUESTION 3.3 (INSERT_ Platform.sql)
--------------------------------------------------

INSERT INTO [Platform]
(Platform_Description)
VALUES('Android'), ('Apple OS'), ('Windows'), ('Blackberry OS')
GO


--QUESTION 3.4 INSERT_Device.sql
--------------------------------------------------

INSERT INTO Device
(Device_TypeID, PlatformID, Manufacturer_Code, Model, InternalMemory, Price)
VALUES (1, 3, 'b', 'Lumia 8', '7 GB', 7500.00),(1, 1, 'a', 'Galaxy A3 LTE', '5 GB', 6499.99),
       (2, 1, 'e', 'Sony Tab', '16 GB', 9500.00),(1, 2, 'd', 'iPhone 6', '7 GB', 15000.00),
       (2, 4, 'c', 'Playbook ', '6 GB', 1500.00)
GO

--------------------------------------------------
--QUESTION 4 DELETE_DEVICE.sql
--------------------------------------------------

DELETE FROM Device
WHERE PlatformID = 4
GO

--------------------------------------------------
--QUESTION 5 --UPDATE_VIDEO.sql
--------------------------------------------------

UPDATE Device
SET Price = 6500.00
WHERE Manufacturer_Code = 'a'
GO


