-- Query 01 suggested solution
----------------------------------------------
USE MusicologyWarehouse
go

SELECT Album_Name, Album_Artist, Album_Year
FROM ALBUM
WHERE (Album_Year < 2000)


-- Query 02 suggested solution
----------------------------------------------
USE MusicologyWarehouse
go

SELECT Customer_Name, Customer_Surname, Customer_Phone, Customer_Address, Customer_Email
FROM   CUSTOMER
WHERE Customer_City IN ('Pretoria', 'Polokwane')

-- Query 03 suggested solution
----------------------------------------------
USE MusicologyWarehouse
go

SELECT *
FROM INVOICE
WHERE  Invoice_Date BETWEEN '2007-01-01'  AND '2007-01-31'

-- Query 04 suggested solution
----------------------------------------------
USE MusicologyWarehouse
go

SELECT Customer_Name, Customer_Surname, Customer_Phone, Customer_Address, Customer_Email
FROM   CUSTOMER
WHERE Customer_Email LIKE  '%tuks.com%'

-- Query 05 suggested solution
----------------------------------------------
USE MusicologyWarehouse
go

SELECT Album_Name, Album_Artist Album_Year
FROM ALBUM
WHERE (Album_Artist = 'Bob Marley') AND (Album_Year  >= 1970) AND (Album_Year <= 1979)


-- Query 06 suggested solution
----------------------------------------------
USE MusicologyWarehouse
go

SELECT Album_Name, Album_Artist Album_Run_Time
FROM ALBUM
WHERE (Album_Artist = 'Justin Timberlake') AND (Album_Run_Time < 1) OR
               (Album_Artist = 'Andrea Bocelli') AND (Album_Run_Time < 1)


-- Query 07 suggested solution
----------------------------------------------
USE MusicologyWarehouse
go

SELECT     Branch_Name,  Branch_Floor_Size, Branch_Phone,
                   Branch_Contact_Name, Branch_City
FROM BRANCH
WHERE NOT ((Branch_City = 'Pretoria')  OR (Branch_City = 'Johannesburg'))  AND  
                        (Branch_Floor_Size > 50)
