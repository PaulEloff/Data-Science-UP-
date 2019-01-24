use Daspoort_Clinic
	go
	
select *
	from Consultation
	where Con_Weight < '65'
	go