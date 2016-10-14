data prog;
input division $ emps increase;
datalines;
	aptops 205 0.075
	finance 198 0.040
	fltops 187 0.080
;
run;

data _null_;
	set prog;
	file '/folders/myfolders/test.csv';
	put division emps increase;
run;

	* the _N_ automatic variable is created by every data step. each time that
the data step loops past the data statment, _N_ is increased by 1. therefore the 
value of _N_ represents the number of times that the DATA step iterated.  the value
is not added to any new data set;
	
	* the END= option in the SET statement creates and names a temporary variable 
that acts as an end-of-file indicator. 
	this temporary variable is initialized to 0. when the SET statement reads the 
last observation of the data set listed, the value of the variable is set to 1. the 
variable is not added to any new data set.;

data aa;
	set prog end =isLast;
	file '/folders/myfolders/test1.csv' dlm=',';
	if _N_ = 1 then put 'division emps increass';
	put division emps increase;
	if isLast = 1 then put 'data:prog';
run;
proc print data=aa; run;







