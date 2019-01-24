--1. Write a query that uses the INNER JOIN to find conditions that have a ‘low’ priority. Display the name, priority and condition type name.
	
SELECT Con_Name, Con_Priority, Con_Type_Name  
FROM Condition a INNER JOIN Condition_Type b
ON a.Con_Type = b.Con_Type_ID 
WHERE a.Con_Priority = 'low'
GO


--2. Write a query that uses the LEFT OUTER JOIN to include all the patients which are not assigned a family member. Display the Invoice Number, Invoice Date, Customer AC Number and the Customer Name

SELECT * FROM Patient a LEFT JOIN Family_Member b ON a.Patient_No = b.Patient_No 
WHERE Member_ID is NUll
GO

	
--3. Write a query that uses the RIGHT OUTER JOIN to include all booking number, user name and booking rep id from booking and booking session id,booking session status, booking session capacity and booking session time from booking session where booking session status is available.

select a.Booking_Session_ID, a.Booking_Session_Status, a.Booking_Session_Capacity, a.Booking_Session_Time, b.Booking_Number, b.[User_Name], b.Booking_Rep_ID
from [BookingSession] as a right outer join Booking as b
on a.[Booking_Session_ID] = b.[Booking_Session_ID]
where a.Booking_Session_Status = 'Available'
go

	
--4.Write a query that uses the FULL OUTER JOIN to display all the order number from order and order line item name, order line description, order line quantity and order line comments from ordeline.

select o.[Order_Number], ol.[Order_Line_Item_Name], ol.[Order_Line_Description], ol.[Order_Line_Quantity], ol.[Order_Line_Comments] 
from [Order] as o full outer join OrderLine as ol
on o.[Order_Number] = ol.[Order_Number]
go
