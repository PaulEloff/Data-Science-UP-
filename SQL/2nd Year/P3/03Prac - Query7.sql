use Daspoort_Clinic
	go
	
select Med_Sup_ID, Med_Sup_Name, Med_Sup_Quantity, Med_Sup_QtyAvailable, Med_Sup_Unit
	from Medical_Supply
	where (Med_Sup_Quantity = Med_Sup_QtyAvailable) and not (Med_Sup_Unit)
	go