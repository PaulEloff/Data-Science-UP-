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