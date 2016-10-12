data prog;
input division $ emps increase;
datalines;
	aptops 205 0.075
	finance 198 0.040
	fltops 187 0.080
;
run;

* using OUTPUT without arguments in data step causes the current observation to be 
written to all data set that are named in the data statement.;

data forecast;
	drop emps;
	set prog;
	year =1;
	new_total = emps*(1+increase);
	output;
	year =2;
	new_total = new_total*(1+increase);
	output;
	year =3;
	new_total = new_total*(1+increase);
	output;
run;

proc print data=forecast;run;