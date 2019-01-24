use Daspoort_Clinic
	go
	
select Consult_No, Con_Hist_BMI, Con_Hist_UrineTest, Con_Consult_Date, Patient_No
	from Consultation
	where Con_Consult_Date between '01-01-2013' and '31-12-2013'
	go