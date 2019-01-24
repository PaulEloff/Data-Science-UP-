use Daspoort_Clinic
	go
	
select *
	from Medical_Supply
	where Med_Sup_Name LIKE ('%u%') AND Med_Sup_Name LIKE ('%p%') 
	go