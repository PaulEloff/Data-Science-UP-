/*
QUERY 1
Write a query that uses the INNER JOIN to find Album Prices of Album_Name 'Toxic'
Display the Album_Artist, the Album_Name and the Price
*/

USE MusicologyWarehouse
GO

SELECT b.Album_Artist, b.Album_Name, a.Price_ID
FROM dbo.Album_Price a INNER JOIN dbo.Album b ON a.Price_ID = b.Price_ID
WHERE b.Album_Name = 'Toxic'
GO

/*
QUERY 2
Write a query that uses the LEFT OUTER JOIN to include all Customers in the results
regardless of whether they are assigned an Invoice
Show the Invoice Number, Invoice Date, Customer AC Number and the Customer Name
*/

USE MusicologyWarehouse
GO

SELECT b.Customer_Acc_No, b.Customer_Name, a.Invoice_Num, a.Invoice_date
FROM dbo.Customer b LEFT OUTER JOIN dbo.Invoice a ON a.Customer_Acc_No = b.Customer_Acc_No
GO

/*
QUERY 3
Write a query that uses the RIGHT OUTER JOIN to include all Invoice_Lines in the results
regardless of whether they are assigned an Invoice Number
Show the Invoice Number, the Customer AC Number, the Album ISBN and the Item Unit Price
*/

USE MusicologyWarehouse
GO

SELECT a.Invoice_Num, a.Customer_Acc_No, b.Album_ISBN, b.Item_Unit_Price
FROM dbo.Invoice a RIGHT OUTER JOIN dbo.Invoice_Line b ON a.Invoice_Num = b.Invoice_Num
GO

/*
QUERY 4
Write a query that uses the FULL OUTER JOIN that returns only those Albums 
that have no matching Album Categories, as well as those Album Categories 
that are not matched to an Album
Show the Album Artist, Album Name, Album Year, Album Category Description
*/

USE MusicologyWarehouse
GO

SELECT a.Album_Artist, a.Album_Name, a.Album_Year, b.Category_Desc
FROM dbo.Album a FULL OUTER JOIN dbo.Album_Category b ON a.Category_ID = b.Category_ID
GO