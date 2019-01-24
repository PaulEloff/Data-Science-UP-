use Daspoort_Clinic
	go
	
select History_ID, Med_Hist_Weight, Med_Hist_Height, Med_Hist_BMI, Patient_No
	from Medical_History
	where (Med_Hist_Weight <= '65') and (Med_Hist_BMI >= '90')
	go