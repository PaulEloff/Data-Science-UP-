--------------------------------------------------
--QUESTION 1
--------------------------------------------------

--Here is a typical script for creating the database on the C:\VideoShop\ path. 
--Can be replaced with the H:\VideoShop\ path

CREATE DATABASE VideoShop
ON
PRIMARY ( NAME = VideoShop_dat,
    FILENAME = 'C:\VideoShop\VideoShop.mdf',
SIZE = 10MB,
MAXSIZE=50MB,
FILEGROWTH=5%)
LOG ON  ( NAME = VideoShoplog,
    FILENAME = 'C:\VideoShop\VideoShoplog.ldf')
GO

--------------------------------------------------
--QUESTION 2
--------------------------------------------------

-- there is no need to create schemas because this is a small db
-- they are nonetheless important in other larger dbs
-- the following creates the tables

use VideoShop
go

CREATE TABLE Video_Category
(CategoryID             INT             IDENTITY(1,1),
Category_Name           varchar(50)     NULL,
Category_Description    varchar(100)    NULL,
CONSTRAINT pk_videocategory PRIMARY KEY (CategoryID))
go

use VideoShop
go

CREATE TABLE Rental_Category
(Rental_CatID           INT             IDENTITY(1,1),
Rental_Cat_Description    varchar(100)    NULL,
Daily_Rental_Amouny         INT             NOT NULL,
CONSTRAINT pk_rentalcategory PRIMARY KEY (Rental_CatID))
go


use VideoShop
go

CREATE TABLE Rating
(Rate_Code                  VARCHAR(50) NOT NULL,
Rate_Description        varchar(100)    NULL,
CONSTRAINT pk_rating PRIMARY KEY (Rate_Code))
go


use VideoShop
go

CREATE TABLE Video
(Serial_Number      INT     IDENTITY(1,1),
CategoryID          INT NOT NULL,
Rental_CatID        INT NOT NULL,
Rate_Code           VARCHAR(50) NOT NULL,
Video_Title         VARCHAR(50) NOT NULL,
CONSTRAINT pk_video PRIMARY KEY (Serial_Number),
CONSTRAINT fk_videotovideocategory FOREIGN KEY (CategoryID) REFERENCES Video_Category(CategoryID),
CONSTRAINT fk_videotorental FOREIGN KEY (Rental_CatID) REFERENCES Rental_Category(Rental_CatID),
CONSTRAINT fk_videotorating FOREIGN KEY (Rate_Code) REFERENCES Rating(Rate_Code))
go



--------------------------------------------------
--QUESTION 3
--------------------------------------------------


--QUESTION 3.1
--------------------------------------------------

--INSERT_VIDEO_CATEGORY1.sql
INSERT INTO Video_Category
(Category_Name, Category_Description)
Values ('Action', 'Action packed movies'), ('Thriller', 'Spine chilling and full of suspense')
go


--QUESTION 3.2
--------------------------------------------------

--INSERT_ RENTAL_CATEGORY.sql
INSERT INTO Rental_Category
(Rental_Cat_Description, Daily_Rental_Amouny)
Values ('Old', 10), ('New', 20)
go


--QUESTION 3.3
--------------------------------------------------

--INSERT_ RATING.sql
INSERT INTO Rating
(Rate_Code, Rate_Description)
Values ('A', 'Suitable for all ages'), ('PG10', 'Parental guidance for children under 10')
go


--QUESTION 3.4
--------------------------------------------------

--INSERT_VIDEO1.sql
-- Now, this question was skipped in the practical sheet
-- students who were alert would have created by themselves some data of some sort
-- taking into consideration the foreign keys
-- this therefore is an example of what could be
INSERT INTO Video
(CategoryID, Rental_CatID, Rate_Code, Video_Title)
VALUES (1, 2, 'A', 'John Travolta captures Mars'), (2, 2, 'PG10', 'Alice in Wonderland')


--------------------------------------------------
--QUESTION 4
--------------------------------------------------

--DELETE_VIDEO.sql
DELETE FROM Video
WHERE CategoryID = 1
go

--------------------------------------------------
--QUESTION 5
--------------------------------------------------

--UPDATE_VIDEO.sql
UPDATE Video
SET Video_Title = 'Barbie peeps into Wonderland'
WHERE CategoryID = 2