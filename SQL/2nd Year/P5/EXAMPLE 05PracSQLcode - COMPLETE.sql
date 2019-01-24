/*
Write one query that finds the total that each customer has spent.
Display both names of the customer and the total amount the customer has spent
Order by the highest paying customer.
*/

USE MusicologyWarehouse
GO


SELECT c.Customer_Name + ' ' + c.Customer_Surname Customer_FullName, SUM(d.Total) 'Total Spend'
FROM dbo.Customer c INNER JOIN 
(SELECT a.Customer_Acc_No, b.Item_Unit_Price * b.Purchase_Quantity Total
FROM dbo.Invoice a INNER JOIN dbo.Invoice_Line b ON a.Invoice_Num = b.Invoice_Num) d 
ON c.Customer_Acc_No = d.Customer_Acc_No
GROUP BY c.Customer_Name + ' ' + c.Customer_Surname 
ORDER BY SUM(d.Total) DESC
GO