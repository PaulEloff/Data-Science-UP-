USE GotchaSystems
GO

SELECT a.Employee_Name, a.Employee_Surname, a.Employee_Status, a.Title_ID
FROM Employee a INNER JOIN Title b ON a.Title_ID = b.Title_ID
WHERE b.Title_Name = 'Mr'
GO