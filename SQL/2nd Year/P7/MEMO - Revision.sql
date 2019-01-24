-- Question 3 Suggest Soultion
Use Ultimate_DataBase
GO

select Convert(varchar(11) ,i.Ins_Date,106)as [Inspection Date], i.Ins_Report as Report, it.IT_Description as [Description], b.BLD_Name as [Building Name]
from Inspection i 
inner join  Inspection_Type it
on i.IT_ID = it.IT_ID 
inner join Building b 
on i.Bld_ID = i.Bld_ID
where it.IT_ID = 2 
and i.Ins_Date between '2006-08-05 00:00:00.000' and '2008-08-05 00:00:00.000' 
and b.Bld_ID = 2



-- Question 4 Suggested Solution
Use Ultimate_DataBase
GO

select  a.App_Names + ' ' + a.App_Surname as [Applicant Name], a.App_ID_Number, DATEDIFF(DD,App_Date_of_Birth,getdate())/365 as [Applicant Age],e.Emp_Name + ' ' + e.Emp_Name as [Employee Name], et.Emp_Type 
from applicant a 
inner join employee e 
on  a.[Empl_ID] = e.[Emp_ID] 
inner join Employee_Type et 
on et.Emp_T_ID = e.Emp_T_ID
where  a.App_Gender = 0 
and DATEDIFF(DD,App_Date_of_Birth,getdate())/365 >=25
and et.Emp_T_ID = 3

-- retrieve the applicants where applicant is 25 and or older, where the applicant is female and where the employee type is just an agent 