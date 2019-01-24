
-- Question 1 Suggested Solution

Use Ultimate_DataBase
GO

create view [Rusternburg breakage] as 
SELECT a.Brk_Description, a.Brk_Date, b.Bld_Name, c.City_Name
  FROM [Ultimate_DataBase].[dbo].[Breakage] as a
  inner join [Ultimate_DataBase].[dbo].Building as b
  on a.Bld_ID = b.Bld_ID
  inner join [Ultimate_DataBase].[dbo].City as c
  on b.City_ID = c.City_ID
  where b.City_ID = 3

	
	select * from [Rusternburg breakage]
	go


-- Question 2 Suggested Solution

use Ultimate_DataBase
go

create view [Amount_of_Complaints] as
SELECT top 100 b.Bld_Name, b.Bld_ID, count(b.Bld_ID) as [Count_]
  FROM [complaints] as c
  Inner Join Building as b
  on c.Bld_ID = b.Bld_ID
  group by  b.Bld_Name, b.Bld_ID
  order by count(b.Bld_ID) 
  go
  
  select *from [Amount_of_Complaints]	