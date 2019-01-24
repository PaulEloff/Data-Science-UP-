proc iml;
seed = 0;
reps = 10000;
n = 75;

p = 1;
v = j(reps,1,0);
tau = j(reps,1,0);

do k=1 to reps;
	/*Generate the series for simulation k*/
	at = j(n,1,0);
	zt = j(n,1,0);
	zt1 = j(n,1,0);
	zt1[1,1] = 0;
	zt[1,1] = at[1,1];
	do t = 2 to n;
		at[t,1] = rannor(seed);
		zt1[t,1] = zt[t-1,1];
		zt[t,1] = p*zt1[t,1] + at[t,1];
	end;
	/*End of generation*/

	/*OLS regression to determine phat*/
	phat = inv(t(zt1)*zt1)*t(zt1)*zt;
	zthat = zt1*phat;
	resid = zt-zthat;
	sse = t(resid)*resid;
	df = n-1;
	mse = sse/df;
	rmse = sqrt(mse);
	sdphat = sqrt(inv(t(zt1)*zt1)#mse);

	/*Determine v and tau*/
	v[k,1] = n*(phat-1);
	tau[k,1] = (phat-1)/(sdphat);
end;

create v_tau var{v tau};
append;

quit;

data Qb;
set v_tau;

size_v = 0;
size_tau = 0;

if v < -8 then size_v = 1;
if tau < -2 then size_tau = 1;
run;

proc means data = Qb;
var size_v size_tau;
run;

proc univariate data = v_tau;
	var v tau;
run;
